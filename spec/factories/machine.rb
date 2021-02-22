FactoryBot.define do
  factory :machine do
    location { Faker::Address.city }
    owner
  end
end
