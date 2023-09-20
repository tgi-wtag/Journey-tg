class UsersController < ApplicationController
  def profile
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

  private

  def user_params
    params.require(:user).permit(:fist_name, :last_name, :date_of_birth, :joining_date)
  end
end