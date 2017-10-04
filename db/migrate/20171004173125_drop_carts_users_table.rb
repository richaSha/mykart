class DropCartsUsersTable < ActiveRecord::Migration
  def change
    drop_table(:carts_users)
  end
end
