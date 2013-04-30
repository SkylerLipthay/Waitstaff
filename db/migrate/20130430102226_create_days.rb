class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :location_id, null: false
      t.date :date, null: false
      t.time :open, null: false
      t.time :close, null: false
      t.boolean :closed, null: false
    end
  end
end
