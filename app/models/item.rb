class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

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

  validates :category_id, numericality: { other_than: 1 } 

  validates :item_status_id, numericality: { other_than: 1 } 

  validates :shipping_fee_id, numericality: { other_than: 1 } 

  validates :shipping_address_id, numericality: { other_than: 1 } 

  validates :shipping_date_id, numericality: { other_than: 1 } 
  
  has_one :buyer
  belongs_to :user
  has_one_attached :image
end
