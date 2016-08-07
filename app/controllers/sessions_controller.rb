class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user 
      if @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @user.errors.add(:password, :blank, message: 'was incorrect')
        render 'new'
      end
    else
      @user = User.new
      @user.errors.add(:email, :blank, message: 'was incorrect')
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
