class UsersController < ApplicationController
  
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
      login.user(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @users.errors.full_messages
      render :new
    end
  end

end
