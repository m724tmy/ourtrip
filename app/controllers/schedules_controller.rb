class SchedulesController < ApplicationController
    before_action :set_room
    before_action :set_schedule, only: [:edit, :update, :show, :destroy]
    before_action :set_location, only: [:add_from_location]
    

    def new
        @schedule = @room.schedules.build
    end

    def create
        @schedule = @room.schedules.build(schedule_params)
        if @schedule.save
            redirect_to room_path(@room), notice: "スケジュールを追加しました"
        else
            # Rails.logger.debug("保存失敗: #{@schedule.errors.full_messages}")
            render :new, alert: "スケジュールの追加に失敗しました"
        end
    end

    def show

    end

    def edit

    end

    def update
        if @schedule.update(schedule_params)
            redirect_to room_schedule_path(@room, @schedule), notice: 'スケジュールを更新しました'
        else
            render :edit, alert: 'スケジュールの更新に失敗しました'
        end
    end

    def destroy
        if @schedule.destroy
            redirect_to room_path(@room), notice: 'スケジュールを削除しました'
        else
            redirect_to room_path(@room), alert: 'スケジュールの削除に失敗しました'
        end
    end

    def add_from_location
        @schedule = @room.schedules.build(
          title: @location.title,
          start_time: @location.start_time,
          end_time: @location.end_time,
          description: @location.description,
          cost: @location.cost,
          reference_url: @location.reference_url,
          latitude: @location.latitude,
          longitude: @location.longitude,
          user_id: @location.user_id
        )
    
        if @schedule.save
          redirect_to room_path(@room), notice: "スケジュールに追加しました"
        else
          redirect_to room_path(@room), alert: "スケジュールへの追加に失敗しました"
        end
      end
    private
    
    def schedule_params
        params.require(:schedule).permit(:title, :start_time, :end_time, :description, :cost, :reference_url, :latitude, :longitude).merge(user_id: current_user.id)
    end

    def set_schedule
        @schedule = @room.schedules.find(params[:id])
    end

    def set_location
        @location = @room.locations.find(params[:location_id])
    end

end