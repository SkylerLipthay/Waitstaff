class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.string :instructions
      t.decimal :base_price, precision: 8, scale: 2, null: false
    end
  end
end
