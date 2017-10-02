class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.column(:username, :string)
      t.column(:password, :string)
      t.column(:email, :string)
      t.column(:first_name, :string)
      t.column(:last_name, :string)

      t.timestamps
    end
  end
end
