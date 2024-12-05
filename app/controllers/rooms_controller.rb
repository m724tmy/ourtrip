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
    @schedules = @room.schedules.order(:start_time) # スケジュールを開始日時順に並び替え
    @locations = @room.locations.order(:start_time)
    @chat_history = @room.chat_histories.order(:created_at)
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
      if @room.users.empty? # 参加者が0人になったら
        @room.destroy
        redirect_to rooms_path, notice: "ルームが削除されました"
      else
        redirect_to rooms_path, notice: "ルームを退出しました"
      end
    else
      redirect_to rooms_path, alert: "ルーム退出に失敗しました"
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :description, :start_time, :end_time)
  end
end
