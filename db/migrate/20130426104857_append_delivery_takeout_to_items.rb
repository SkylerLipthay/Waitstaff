class AppendDeliveryTakeoutToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      # can be: both, delivery, takeout
      t.string :order_options, null: false, default: 'both'
    end
  end
end
