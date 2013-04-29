class CreateOptionGroups < ActiveRecord::Migration
  def change
    create_table :option_groups do |t|
      t.string :name, null: false
      # 0 => one or more, 1..100 => select exactly 1..100
      t.integer :max_selection, default: 0
    end
  end
end
