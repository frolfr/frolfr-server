class AddNullConstraintToHoleNumber < ActiveRecord::Migration[4.2]
  def change
    change_column :turns, :hole_number, :integer, null: false
  end
end
