class CreateJournalEntry < ApplicationRecord
    belongs_to :create_user
  
    # Validations
    validates :title, presence: true
    # Add more validations as needed
  
    # Additional methods, if needed
  end
  