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
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @room = Room.find(params[:id])
    @schedules = @room.schedules.includes(:user).order(:start_time)
    @locations = @room.locations.includes(:user).order(:start_time)
    @chat_history = @room.chat_histories.order(:created_at)
    @participants = @room.users
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])
    room.update(room_params)
    redirect_to room_path(room)
  end

  def leave
    @room = Room.find(params[:id])
    room_user = RoomUser.find_by(user: current_user, room: @room)

    if room_user
      room_user.destroy
      if @room.users.empty?
        @room.destroy
        redirect_to rooms_path
      else
        redirect_to rooms_path
      end
    else
      redirect_to rooms_path, notice: "ルーム退出に失敗しました"
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :description, :start_time, :end_time)
  end
end
