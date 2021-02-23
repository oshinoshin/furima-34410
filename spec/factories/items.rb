FactoryBot.define do
  factory :item do
    name                {'iphone12'}
    description         {Faker::Lorem.sentence}
    category_id         {2}
    item_status_id      {2}
    shipping_fee_id     {2}
    shipping_address_id {2}
    shipping_date_id    {2}
    price               {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
