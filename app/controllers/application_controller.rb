class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token


    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end

    def set_room
        @room = Room.find(params[:room_id])
    end
end
