class Task < ApplicationRecord
  belongs_to :user
  enum status: {
    todo: 0,
    in_progress: 1,
    finished: 2
  }
  validates :title, presence: true
end
