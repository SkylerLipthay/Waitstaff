class OhGodUpdateRelations < ActiveRecord::Migration
  def change
    change_table :option_groups do |t|
      t.integer :user_id
    end

    change_table :options do |t|
      t.integer :option_group_id
    end

    change_table :categories do |t|
      t.integer :user_id
    end

    change_table :items do |t|
      t.integer :category_id
    end
  end
end
