class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:category_id, :int)
      t.column(:description, :string)
      t.column(:quantity, :int)
      t.column(:list_price, :int)
      t.column(:sale_price, :int)

      t.timestamps
    end
  end
end
