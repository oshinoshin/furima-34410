class Address < ApplicationRecord
  belongs_to :buyer

  # with_options presence: true do
  # validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  # validates :shipping_address_id, numericality: {other_than: 0}
  # validates :municipalities
  # validates :address
  # validates :phone_number, format: {with: /\A[0-9]+\z/}
  # end
end
