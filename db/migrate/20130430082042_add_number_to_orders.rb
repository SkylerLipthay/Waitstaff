class AddNumberToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.integer :number
    end
  end
end
