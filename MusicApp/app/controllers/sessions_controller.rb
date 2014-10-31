class SessionsController < ApplicationController
  
  before_action :require_no_user!, only: [:create, :new]
  
  def create
    user = User.find_by_credentials(
      params[:user][:email], params[:user][:password])
    
    if user.nil?
      flash[:errors] = ["Incorrect login info"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url
    end
  end
  
  def destroy
    log_out_user!
    redirect_to new_session_url
  end
  
  def new
    render :new
  end
  
end
