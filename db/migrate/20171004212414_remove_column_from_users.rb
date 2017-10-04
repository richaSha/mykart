class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column(:users, :cart_id)
  end
end
