class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :shipping_address_id
      t.string :municipalities
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :buyer
      t.timestamps
    end
  end
end
