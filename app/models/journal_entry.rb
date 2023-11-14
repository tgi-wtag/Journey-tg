class JournalEntry < ApplicationRecord
  belongs_to :user
  has_one_attached :attached_document
  validates :title, presence: true
  validates :content, presence: true
end
