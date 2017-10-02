class CreateCarts < ActiveRecord::Migration
  def change
    create_table(:carts) do |t|
      t.column(:user_id, :int)

      t.timestamps
    end
  end
end
