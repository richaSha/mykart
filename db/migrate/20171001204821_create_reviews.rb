class CreateReviews < ActiveRecord::Migration
  def change
    create_table(:reviews) do |t|
      t.column(:product_id, :int)
      t.column(:user_id, :int)
      t.column(:rating, :int)
      t.column(:comment, :string)

      t.timestamps
    end
  end
end
