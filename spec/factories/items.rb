FactoryBot.define do
  factory :item do

    name {Faker::Lorem.sentence}
    introduction {Faker::Lorem.sentence}
    category {Faker::Lorem.sentence}
    condition {Faker::Lorem.sentence}
    shipping_fee {Faker::Lorem.sentence}
    prefecture {Faker::Lorem.sentence}
    shipping_day {Faker::Lorem.sentence}
    price {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
