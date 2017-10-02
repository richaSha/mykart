class CreateOrders < ActiveRecord::Migration
  def change
    create_table(:orders) do |t|
      t.column(:user_id, :int)
      t.column(:status, :string)

      t.timestamps
    end
  end
end
