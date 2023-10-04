class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:alert] = t('alerts.login.succesfull')
    else
      flash[:alert] = t('alerts.login.failed')
      redirect_to new_user_session_path
    end
  end
  def destroy
  session[:user_id] = nil
  redirect_to root_path
end
end
