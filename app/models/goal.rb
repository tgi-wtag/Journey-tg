class Goal < ApplicationRecord
  enum status: {
    setted: 0,
    working_on: 1,
    archived: 2
  }
  validates_presence_of :description
end
