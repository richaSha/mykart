class CreateCartsUsersTable < ActiveRecord::Migration
  def change
    create_table :carts_users do |t|
      t.column :cart_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
