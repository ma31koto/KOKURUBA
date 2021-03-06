FactoryBot.define do
  factory :customer do
    name { Faker::Lorem.characters(number: 5) }
    gender { "man" }
    age { Faker::Number.between(from: 1, to: 100) }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    biography { Faker::Lorem.characters(number: 10) }
    is_deleted { "false" }
  end
end
