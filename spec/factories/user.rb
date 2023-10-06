require 'ffaker'

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    date_of_birth { FFaker::Time.between(60.years.ago, 18.years.ago) }
    joining_date { FFaker::Time.between(5.years.ago, Date.today) }
    designation { FFaker::Job.title }
    email { FFaker::Internet.email }
    password { 'valid_password' }
    password_confirmation { 'valid_password' }
  end
end
