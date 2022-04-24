FactoryBot.define do
  factory :relationship do
    follower factory: :customer
    followed factory: :customer
  end
end
