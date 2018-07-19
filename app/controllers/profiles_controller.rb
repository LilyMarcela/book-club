class ProfilesController < ApplicationController

  def activity
    @profile = User.find(params[:user_id])
  end
end
