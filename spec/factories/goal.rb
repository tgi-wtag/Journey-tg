FactoryBot.define do
  factory :goal do
    description { FFaker::Lorem.sentence }
    deadline { FFaker::Time.date }
    status { :setted }
    user
  end
end
