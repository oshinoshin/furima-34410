class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_fee_id
    validates :shipping_address_id
    validates :shipping_date_id
    validates :price
  end
  
  has_one :buyer
  belongs_to :user
  has_one_attached :image
end
