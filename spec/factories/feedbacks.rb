FactoryBot.define do
  factory :feedback do
    email { Faker::Internet.email }
    message { Faker::Lorem.sentence(word_count: 10) }
  end
end
