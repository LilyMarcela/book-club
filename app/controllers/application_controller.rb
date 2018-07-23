class ApplicationController < ActionController::Base
   before_action :set_background
   def set_background
    if params[:controller] == "devise/sessions" || params[:controller] == "devise/registrations" || params[:controller] == "devise/passwords"
      @background_pic = "sunsetpic"
    end
   end
end
