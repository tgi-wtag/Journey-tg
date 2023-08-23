class CreateGoal < ApplicationRecord
    belongs_to :create_user
  
    # Validations
    validates :description, presence: true
    # Add more validations as needed
  
    # Additional methods, if needed
  end
  