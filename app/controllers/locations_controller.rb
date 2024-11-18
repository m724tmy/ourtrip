class LocationsController < ApplicationController
    def new
        @room = Room.find(params[:room_id])
        @location = @room.locations.build
    end

    def create
        @room = Room.find(params[:room_id])
        @location = @room.locations.build(location_params)
        if @location.save
            redirect_to room_path(@room), notice: "行きたい場所を追加しました"
        else
            # Rails.logger.debug("保存失敗: #{@location.errors.full_messages}")
            render :new, alert: "行きたい場所の追加に失敗しました"
        end
    end

    private

    def location_params
        params.require(:location).permit(:title, :start_time, :end_time, :description, :cost, :reference_url, :latitude, :longitude).merge(user_id: current_user.id)
    end
end
