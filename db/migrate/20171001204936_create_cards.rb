class CreateCards < ActiveRecord::Migration
  def change
    create_table(:cards) do |t|
      t.column(:user_id, :int)
      t.column(:card_no, :int)
      t.column(:exp_year, :int)
      t.column(:exp_month, :int)
      t.column(:name_on_card, :string)

      t.timestamps
    end
  end
end
