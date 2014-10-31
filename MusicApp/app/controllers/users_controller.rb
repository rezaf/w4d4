class UsersController < ApplicationController
  
  before_action :require_no_user!
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

end
