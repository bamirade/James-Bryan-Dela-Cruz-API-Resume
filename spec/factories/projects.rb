FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    role { Faker::Job.title }
    repo { "https://github.com/#{Faker::Internet.user_name}/#{Faker::Lorem.word}" }
    live { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    feature1 { Faker::Lorem.sentence }
    feature2 { Faker::Lorem.sentence }
    feature3 { Faker::Lorem.sentence }
    feature4 { Faker::Lorem.sentence }
  end
end
