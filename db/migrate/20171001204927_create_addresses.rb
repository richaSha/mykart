class CreateAddresses < ActiveRecord::Migration
  def change
    create_table(:addresses) do |t|
      t.column(:user_id, :int)
      t.column(:house_no, :int)
      t.column(:street, :string)
      t.column(:city, :string)
      t.column(:state, :string)
      t.column(:country, :string)
      t.column(:zipcode, :int)

      t.timestamps
    end
  end
end
