class GoalsController < ApplicationController
  before_action :find_goal, only: %i[show edit update] 

  def goals
    @goals = Goal.all
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to user_goals_path
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_goal_path(@user, @goal)
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :deadline, :status)
  end

  def find_goal
    @user = User.find(params[:user_id])
    @goal = @user.goals.find(params[:id])
  end
end
