class LocationsController < ApplicationController
    before_action :set_room
    before_action :set_location, only: [:edit, :update, :show, :destroy]

    def new
        @location = @room.locations.build
    end

    def create
        @location = @room.locations.build(location_params)
        if @location.save
            redirect_to room_path(@room), notice: "行きたい場所を追加しました"
        else
            # Rails.logger.debug("保存失敗: #{@location.errors.full_messages}")
            render :new, alert: "行きたい場所の追加に失敗しました"
        end
    end

    def show

    end

    def edit

    end

    def update
        if @location.update(location_params)
            redirect_to room_location_path(@room, @location), notice: '行きたい場所を更新しました'
        else
            render :edit, alert: '行きたい場所の更新に失敗しました'
        end
    end

    def destroy
        if @location.destroy
            redirect_to room_path(@room), notice: 'スケジュールを削除しました'
        else
            redirect_to room_path(@room), alert: 'スケジュールの削除に失敗しました'
        end
    end

    private

    def location_params
        params.require(:location).permit(:title, :start_time, :end_time, :description, :cost, :reference_url, :latitude, :longitude).merge(user_id: current_user.id)
    end

    def set_location
        @location = @room.locations.find(params[:id])
    end

end