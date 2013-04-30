class ChangePrecisionScales < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.change :sales_tax, :decimal, precision: 6, scale: 3
      t.change :minimum_total, :decimal, precision: 10, scale: 2
      t.change :delivery_fee, :decimal, precision: 11, scale: 3
      t.change :max_distance, :decimal, precision: 11, scale: 3
    end

    change_table :options do |t|
      t.change :extra, :decimal, precision: 10, scale: 2
    end

    change_table :items do |t|
      t.change :price, :decimal, precision: 10, scale: 2
    end

    change_table :orders do |t|
      t.change :subtotal, :decimal, precision: 10, scale: 2
      t.change :sales_tax, :decimal, precision: 11, scale: 3
      t.change :delivery_fee, :decimal, precision: 10, scale: 2
      t.change :total, :decimal, precision: 10, scale: 2
    end

    change_table :order_items do |t|
      t.change :base_price, :decimal, precision: 10, scale: 2
    end
  end
end
