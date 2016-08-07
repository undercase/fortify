class UsersController < ApplicationController
  def new
    if params[:user]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def create
    if (User.where(email: user_params[:email]).empty?)
      @user = User.create(user_params)
      if @user.save
        redirect_to new_session_path
      else
        render 'new'
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy
  end

  protected
    def user_params
      params.require(:user).permit(:email, :first_name, :password, :password_confirmation)
    end
end
