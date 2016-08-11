class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    if session[:user_id].nil?
      return false
    elsif current_user
      return true
    else
      session[:user_id] = nil
      return false
    end
  end

  def authorize
    redirect_to root_path unless logged_in?
  end
end
