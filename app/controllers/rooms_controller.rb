class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:invite, :index]
  before_action :authorize_user, only: [:show]
  def index
  end

  def new
    @room = Room.new
  end

  def create
    params[:room][:start_time] = combine_date_and_time(params[:room][:start_time], params[:room][:start_date])
    params[:room][:end_time] = combine_date_and_time(params[:room][:end_time], params[:room][:end_date])
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
    params[:room][:start_time] = combine_date_and_time(params[:room][:start_time], params[:room][:start_date])
    params[:room][:end_time] = combine_date_and_time(params[:room][:end_time], params[:room][:end_date])
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

  def invite
    @room = Room.find_by(invite_token: params[:id])

    if @room.present?
      RoomUser.find_or_create_by(user: current_user, room: @room)
      redirect_to @room, notice: 'ルームに参加しました。'
    else
      redirect_to root_path, alert: '無効な招待リンクです。'
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :description, :start_time, :end_time)
  end

  def combine_date_and_time(time, date)
    return if time.blank? || date.blank?
    "#{date} #{time}".to_datetime
  end


  def authorize_user
    @room = Room.find_by(id: params[:id])
    if @room.nil? || !@room.users.include?(current_user)
      flash[:alert] = "このルームにアクセスする権限がありません。"
      redirect_to root_path
    end
  end
end
