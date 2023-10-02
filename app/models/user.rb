class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, uniqueness: true
end
