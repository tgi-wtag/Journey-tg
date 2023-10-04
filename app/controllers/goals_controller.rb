class GoalsController < ApplicationController
  def goals
    @goals = Goal.all
  end


  def new
    @goal = Goal.new
  end
  def create
    @goal= Goal.new(entry_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goals_path(@goals)
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:goal).permit(:description, :deadline)
  end
end
