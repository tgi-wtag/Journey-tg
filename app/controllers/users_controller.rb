class UsersController < ApplicationController
  def profile
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:fist_name, :last_name, :date_of_birth, :joining_date)
  end
end