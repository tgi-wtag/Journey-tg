class TasksController < ApplicationController
  before_action :set_user
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = @user.tasks
  end

  def new
    @task = @user.tasks.new
  end

  def create
    @task = @user.tasks.new(task_params)

    if @task.save
      redirect_to user_tasks_path(@user)
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def edit
    @user = @task.user
  end

  def update
    if @task.update(task_params)
      redirect_to user_task_path(@user, @task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to user_tasks_path(@user)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :attached_document, :status)
  end

  def find_task
    @task = @user.tasks.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
