class Task < ApplicationRecord
  enum status: {
    todo: 0,
    in_progress: 1,
    finished: 2
  }
  validates_presence_of :title
end
