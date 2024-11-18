class SchedulesController < ApplicationController
    def new
        @room = Room.find(params[:room_id])
        @schedule = @room.schedules.build
    end

    def create
        @room = Room.find(params[:room_id])
        @schedule = @room.schedules.build(schedule_params)
        if @schedule.save
            redirect_to room_path(@room), notice: "スケジュールを追加しました"
        else
            # Rails.logger.debug("保存失敗: #{@schedule.errors.full_messages}")
            render :new, alert: "スケジュールの追加に失敗しました"
        end
    end

    def show
        @room = Room.find(params[:room_id])
        @schedule = @room.schedules.find(params[:id])
      end

    private

    def schedule_params
        params.require(:schedule).permit(:title, :start_time, :end_time, :description, :cost, :reference_url, :latitude, :longitude).merge(user_id: current_user.id)
    end
end