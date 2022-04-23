FactoryBot.define do
  factory :post_comment do
    title { Faker::Lorem.characters(number: 5) }
    comment { Faker::Lorem.characters(number: 10) }
    atmosphere_rate { 3.5 }
    few_people_rate { 3.5 }
    standard_rate { 3.5 }
    all_rate { 3.5 }
    confession_result { "yes" }
    customer_id { FactoryBot.create(:customer).id }
    post_id { FactoryBot.create(:post).id }
  end
end
