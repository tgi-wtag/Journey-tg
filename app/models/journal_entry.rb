class JournalEntry < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
