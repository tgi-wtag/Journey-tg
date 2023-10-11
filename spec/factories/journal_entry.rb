FactoryBot.define do
  factory :journal_entry do
    user
    title { Faker::Lorem.sentence }
    date { Faker::Date.backward(days: 365) }
    content { Faker::Lorem.paragraph }
  end
end
