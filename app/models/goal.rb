class Goal < ApplicationRecord
  # belongs_to :user
  enum status: {
    setted: 0,
    workingon: 1,
    archived: 2
end
