class ChangeItemsToCartsTable < ActiveRecord::Migration
  def change
    rename_table('items', 'carts')
  end
end
