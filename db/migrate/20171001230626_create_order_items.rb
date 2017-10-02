class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table(:order_items) do |t|
      t.column(:order_id, :int)
      t.column(:product_id, :int)
      t.column(:price, :int)
      t.column(:quantity, :int)

      t.timestamps
    end
  end
end
