class AddFullNameToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :full_name
    end
  end
end
