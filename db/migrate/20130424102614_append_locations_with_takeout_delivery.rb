class AppendLocationsWithTakeoutDelivery < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      # can be: both, delivery, takeout
      t.string :order_options, null: false, default: 'both'
      t.decimal :max_distance, precision: 8, scale: 3, null: false, default: 5.0
    end
  end
end
