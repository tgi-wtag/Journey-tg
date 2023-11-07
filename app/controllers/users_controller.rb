class UsersController < ApplicationController
  def index
    if current_user.admin? || current_user.super_admin?
      @users = User.all
    else
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def update_role
    @user = User.find(params[:id])
    
    if @user.user?
      @user.role = 'admin'
      flash[:notice] = t('user_role_updated_admin')
    elsif @user.admin?
      @user.update(role: :user)
      flash[:notice] = t('user_role_updated_user')
    else
      flash[:error] = t('role_update_failed')
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :joining_date, :designation, :email, :password, :password_confirmation, :role)
  end
end
