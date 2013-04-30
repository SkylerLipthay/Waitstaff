class RenameOrderItemOptions < ActiveRecord::Migration
  def change
    rename_table(:order_items_options, :options_order_items)
  end
end
