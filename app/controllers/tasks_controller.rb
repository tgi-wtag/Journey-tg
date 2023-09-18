# frozen_string_literal: true

class TasksController < ApplicationController
  def tasks
    @tasks = Task.all
  end
end
