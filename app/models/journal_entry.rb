class JournalEntry < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  valitates :user_id, presence: true
end
