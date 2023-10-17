class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update]

  def goals
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      if @goal.description.present?
        redirect_to goal_path(@goal)
      else
        flash[:error] = t('errors.no_description')
        redirect_to new_goal_path
      end
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :deadline, :status)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
