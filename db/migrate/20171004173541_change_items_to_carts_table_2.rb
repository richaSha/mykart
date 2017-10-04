class ChangeItemsToCartsTable2 < ActiveRecord::Migration
  def change
    rename_table('items', 'carts')
  end
end
