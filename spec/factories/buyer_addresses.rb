FactoryBot.define do
  factory :buyer_address do
    postal_code {"180-0002"}
    shipping_address_id {13}
    municipalities {"武蔵野市"}
    address {"東町1-6-19"}
    building_name {"B2"}
    phone_number {"09014389954"}
    user_id {1}
    item_id {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
