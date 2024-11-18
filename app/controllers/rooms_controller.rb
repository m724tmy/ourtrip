class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      RoomUser.create(user: current_user, room: @room)
      redirect_to rooms_path, notice: "ルームを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @room = Room.find(params[:id])
    @schedules = @room.schedules
    @locations = @room.locations
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])
    room.update(room_params)
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :description, :start_time, :end_time)
  end
end
