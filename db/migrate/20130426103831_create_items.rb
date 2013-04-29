class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :price, precision: 8, scale: 2, null: false, default: 0.0
    end
  end
end
