FactoryBot.define do
  factory :area do
    name { Faker::Lorem.characters(number: 5) }
  end
end
