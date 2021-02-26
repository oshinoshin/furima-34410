class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :shipping_address
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_fee_id
    validates :shipping_address_id
    validates :shipping_date_id
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :item_status_id
    validates :shipping_fee_id
    validates :shipping_address_id
    validates :shipping_date_id
  end
  
  # has_one :buyer
  belongs_to :user
  has_one_attached :image
end
