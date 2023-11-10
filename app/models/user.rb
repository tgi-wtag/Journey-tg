class User < ApplicationRecord
  has_secure_password
  has_many :journal_entries
  has_many :goals
  has_many :tasks
  validates :first_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  enum role: { user: 0, admin: 1, super_admin: 2 }
end
