class AddNullConstraintToHoleNumber < ActiveRecord::Migration
  def change
    change_column :turns, :hole_number, :integer, null: false
  end
end
