class AddColumnHoleNumberToTurns < ActiveRecord::Migration[4.2]
  def change
    add_column :turns, :hole_number, :integer
  end
end
