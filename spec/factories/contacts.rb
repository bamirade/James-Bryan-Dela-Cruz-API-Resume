FactoryBot.define do
  factory :contact do
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    gitHub { "https://github.com/#{Faker::Internet.user_name}" }
    linkedIn { "https://www.linkedin.com/in/#{Faker::Internet.user_name}" }
  end
end
