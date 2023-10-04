class User < ApplicationRecord
  has_secure_password
  has_many :journal_entries
  validates :first_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
  validates :password, presence: true
  validates_confirmation_of :password
end
