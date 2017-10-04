class ChangeColumnNameCartIdToUserId < ActiveRecord::Migration
  def change
    rename_column(:carts, :cart_id, :user_id)
  end
end
