require 'faker'
FactoryBot.define do
  factory :journal_entry do
    title { Faker::Lorem.sentence }
    date { Faker::Date.backward(days: 365) }
    content { Faker::Lorem.paragraph }
  end
end
