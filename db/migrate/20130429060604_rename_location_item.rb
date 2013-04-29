class RenameLocationItem < ActiveRecord::Migration
  def change
    rename_table(:location_items, :items_locations)
  end
end
