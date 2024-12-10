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
            redirect_to room_path(@room)
        else
            render :new, notice: "スケジュールの追加に失敗しました"
        end
    end

    def show

    end

    def edit

    end

    def update
        params[:schedule][:start_time] = combine_date_and_time(params[:schedule][:start_time], params[:schedule][:start_date])
        params[:schedule][:end_time] = combine_date_and_time(params[:schedule][:end_time], params[:schedule][:end_date])

        if @schedule.update(schedule_params)
            redirect_to room_path(@room)
        else
            render :edit, notice: 'スケジュールの更新に失敗しました'
        end
    end
    
    def destroy
        if @schedule.destroy
            redirect_to room_path(@room)
        else
            redirect_to room_path(@room), notice: 'スケジュールの削除に失敗しました'
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
          redirect_to room_path(@room)
        else
          redirect_to room_path(@room), notice: "スケジュールへの追加に失敗しました"
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

    def combine_date_and_time(time, date)
        return if time.blank? || date.blank?
        "#{date} #{time}".to_datetime
    end

end