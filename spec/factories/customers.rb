FactoryBot.define do
  factory :customer do
    name { Faker::Lorem.characters(number: 5) }
    gender { "man" }
    age { Faker::Number.binary(digits: 2) }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    biography { Faker::Lorem.characters(number: 10) }
    is_deleted { "false" }
  end
end
