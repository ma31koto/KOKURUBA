FactoryBot.define do
  factory :customer do
    name { Faker::Lorem.characters(number: 5) }
    gender { "man" }
    age { 27 }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    biography { Faker::Lorem.characters(number: 10) }
    is_deleted { "false" }
  end
end
