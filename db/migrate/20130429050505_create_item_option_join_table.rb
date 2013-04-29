class CreateItemOptionJoinTable < ActiveRecord::Migration
  def change
    create_table :items_option_groups, :id => false do |t|
      t.integer :item_id
      t.integer :option_group_id
    end
  end
end
