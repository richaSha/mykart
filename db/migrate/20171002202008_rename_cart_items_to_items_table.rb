class RenameCartItemsToItemsTable < ActiveRecord::Migration
  def change
    rename_table(:cart_items, :items)
  end
end
