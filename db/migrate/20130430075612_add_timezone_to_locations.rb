class AddTimezoneToLocations < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.string :timezone
    end
  end
end
