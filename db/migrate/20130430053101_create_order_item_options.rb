class CreateOrderItemOptions < ActiveRecord::Migration
  def change
    create_table :order_items_options, :id => false do |t|
      t.integer :order_item_id
      t.integer :option_id
    end
  end
end
