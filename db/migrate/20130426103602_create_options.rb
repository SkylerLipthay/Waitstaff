class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :extra, precision: 8, scale: 2, null: false, default: 0.0
    end
  end
end
