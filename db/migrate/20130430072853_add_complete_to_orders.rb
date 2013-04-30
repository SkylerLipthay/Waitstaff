class AddCompleteToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.boolean :complete, default: false, null: false
    end
  end
end
