FactoryBot.define do
  factory :task do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    attached_document { FFaker::Internet.http_url }
    status { :todo }
    user
  end
end
