class AppendLocations < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.string :phone
      t.string :website
      t.decimal :sales_tax, precision: 3, scale: 3, null: false, default: 0.0
      t.decimal :minimum_total, precision: 8, scale: 2, null: false, default: 0.0
      t.decimal :delivery_fee, precision: 8, scale: 3, null: false, default: 0.0
      # can be: fixed, percent, distance
      t.string :delivery_fee_type, null: false, default: 'fixed'
    end
  end
end
