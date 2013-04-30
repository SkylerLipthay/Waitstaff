class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false

      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :phone, null: false

      t.decimal :subtotal, precision: 8, scale: 2, null: false
      t.decimal :sales_tax, precision: 3, scale: 3, null: false
      t.boolean :delivery, null: false
      t.decimal :delivery_fee, precision: 8, scale: 2, null: false
      t.decimal :total, precision: 8, scale: 2, null: false
    end
  end
end
