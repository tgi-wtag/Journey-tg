class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, uniqueness: true
  has_many :journal_entries
end
