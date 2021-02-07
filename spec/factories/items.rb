FactoryBot.define do

  factory :item do
    name                       {"おもちゃ"}
    introduction               {"黒い星"}
    category_id                {3}
    condition_id               {2}
    shipping_fee_id            {2}
    prefecture_id              {10}
    shipping_day_id            {2}
    price                      {500}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
