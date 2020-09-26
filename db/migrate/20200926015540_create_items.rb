class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false
      t.string :name,                  null: false
      t.string :description,           null: false
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false
      t.integer :shipping_fee_id,      null: false
      t.integer :ship_from_address_id, null: false
      t.integer :shipping_days_id,     null: false
      t.integer :price,                null: false
      t.timestamps
    end
  end
end
