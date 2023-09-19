class UsersController < ApplicationController
  def profile
  end

  def new
    @user = User.new
  end
end