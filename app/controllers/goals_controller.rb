class GoalsController < ApplicationController
    def goals
      @goals = Goal.all
    end
  end
  