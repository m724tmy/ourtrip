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

  private

  def room_params
    params.require(:room).permit(:room_name)
  end
end
