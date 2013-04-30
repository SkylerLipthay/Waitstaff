class AddTimesToLocations < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.time :time_open_sunday
      t.time :time_close_sunday
      t.boolean :closed_sunday, default: false

      t.time :time_open_monday
      t.time :time_close_monday
      t.boolean :closed_monday, default: false

      t.time :time_open_tuesday
      t.time :time_close_tuesday
      t.boolean :closed_tuesday, default: false

      t.time :time_open_wednesday
      t.time :time_close_wednesday
      t.boolean :closed_wednesday, default: false

      t.time :time_open_thursday
      t.time :time_close_thursday
      t.boolean :closed_thursday, default: false

      t.time :time_open_friday
      t.time :time_close_friday
      t.boolean :closed_friday, default: false

      t.time :time_open_saturday
      t.time :time_close_saturday
      t.boolean :closed_saturday, default: false
    end
  end
end
