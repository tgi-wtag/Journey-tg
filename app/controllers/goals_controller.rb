# frozen_string_literal: true

class GoalsController < ApplicationController
  def goals
    @goals = Goal.all
  end
end
