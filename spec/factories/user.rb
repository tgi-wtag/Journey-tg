FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    date_of_birth { Date.new(1990, 1, 1) }
    joining_date { Date.new(2023, 9, 1) }
    designation { 'Developer' }
    email { 'john@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
