class TasksController < ApplicationController
  def tasks
    @tasks = Task.all
  end
end
