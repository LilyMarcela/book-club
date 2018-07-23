class ApplicationController < ActionController::Base
   def set_background
    if params[:controller] == "devise/sessions" || params[:controller] == "devise/registrations" || params[:controller] == "devise/passwords"
      @background_pic = "sunsetpic"
    end
   end
end
