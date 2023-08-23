class CreateUser < ApplicationRecord
    has_many :journal_entries, class_name: 'CreateJournalEntry'
    has_many :tasks, class_name: 'CreateTask'
    has_many :goals, class_name: 'CreateGoal'
  
    # Validations
    validates :name, presence: true
    # Add more validations as needed
  
    # Additional methods, if needed
  end
  