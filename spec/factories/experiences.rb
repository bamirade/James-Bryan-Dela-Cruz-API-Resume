FactoryBot.define do
  factory :experience do
    title { Faker::Job.title }
    company { Faker::Company.name }
    start_date { Faker::Date.backward(days: 365) }
    end_date { Faker::Date.forward(days: 365) }
    responsibility1 { Faker::Lorem.sentence }
    responsibility2 { Faker::Lorem.sentence }
    responsibility3 { Faker::Lorem.sentence }
  end
end
