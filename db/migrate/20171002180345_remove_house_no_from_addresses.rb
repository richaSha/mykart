class RemoveHouseNoFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :house_no
  end
end
