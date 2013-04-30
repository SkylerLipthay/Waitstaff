class ChangeOrderUserToLocation < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.rename :user_id, :location_id
    end
  end
end
