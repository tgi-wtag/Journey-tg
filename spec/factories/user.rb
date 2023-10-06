FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    date_of_birth { FFaker::Time.between(50.years.ago, 18.years.ago) }
    joining_date { FFaker::Time.between(1.year.ago, Date.today) }
    designation { FFaker::Job.title }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
