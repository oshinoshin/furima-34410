class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_address_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :shipping_address_id
    validates :municipalities
    validates :address
    validates :building_name
    validates :phone_number
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, shipping_address_id: shipping_address_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id) 
  end
end

