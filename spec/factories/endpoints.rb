FactoryBot.define do
  factory :endpoint do
    description { Faker::Lorem.sentence }
    url { Faker::Internet.url }
  end
end
