# frozen_string_literal: true

class Goal < ApplicationRecord
  enum status: {
    setted: 0,
    working_on: 1,
    archived: 2
  }
  validates :description, presence: true
end
