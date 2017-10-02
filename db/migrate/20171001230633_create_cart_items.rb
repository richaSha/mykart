class CreateCartItems < ActiveRecord::Migration
  def change
    create_table(:cart_items) do |t|
      t.column(:cart_id, :int)
      t.column(:product_id, :int)
      t.column(:quantity, :int)

      t.timestamps
    end
  end
end
