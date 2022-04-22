FactoryBot.define do
  factory :post do
    postal_code {"105-0011"}
    address { Faker::Lorem.characters(number: 10) }
    longitude {139.7454329}
    latitude {35.6585805}
    title { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 10) }
    atmosphere_rate {3.5}
    few_people_rate {3.5}
    standard_rate {3.5}
    all_rate {3.5}
    confession_result {"yes"}
    area_id {FactoryBot.create(:area).id}
    customer_id {FactoryBot.create(:customer).id}
  end
end
