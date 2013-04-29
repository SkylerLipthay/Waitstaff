class CreateLocationItemJoinTable < ActiveRecord::Migration
  def change
    create_table :location_items, :id => false do |t|
      t.integer :location_id
      t.integer :item_id
    end
  end
end
