class CreateProductImages < ActiveRecord::Migration
  def change
    create_table(:product_images) do |t|
      t.column(:product_id, :int)
      t.column(:url, :string)

      t.timestamps
    end
  end
end
