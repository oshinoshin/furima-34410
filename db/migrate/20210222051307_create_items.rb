class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :item_status_id
      t.integer :shipping_fee_id
      t.integer :shipping_address_id
      t.integer :shipping_date_id
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
