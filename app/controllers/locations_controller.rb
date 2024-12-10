class LocationsController < ApplicationController
    before_action :set_room
    before_action :set_location, only: [:edit, :update, :show, :destroy]

    def new
        @location = @room.locations.build
    end

    def create
        @location = @room.locations.build(location_params)
        if @location.save
            redirect_to room_path(@room)
        else
            render :new, notice: "行きたい場所の追加に失敗しました"
        end
    end

    def show

    end

    def edit

    end

    def update
        params[:location][:start_time] = combine_date_and_time(params[:location][:start_time], params[:location][:start_date])
        params[:location][:end_time] = combine_date_and_time(params[:location][:end_time], params[:location][:end_date])
        if @location.update(location_params)
            redirect_to room_path(@room)
        else
            render :edit, notice: '行きたい場所の更新に失敗しました'
        end
    end

    def destroy
        if @location.destroy
            redirect_to room_path(@room)
        else
            redirect_to room_path(@room), notice: 'スケジュールの削除に失敗しました'
        end
    end

    private

    def location_params
        params.require(:location).permit(:title, :start_time, :end_time, :description, :cost, :reference_url, :latitude, :longitude).merge(user_id: current_user.id)
    end

    def set_location
        @location = @room.locations.find(params[:id])
    end

    def combine_date_and_time(time, date)
        return if time.blank? || date.blank?
        "#{date} #{time}".to_datetime
    end

end