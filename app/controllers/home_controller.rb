class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to workouts_path
    else
      @user = User.new
    end
  end
end
