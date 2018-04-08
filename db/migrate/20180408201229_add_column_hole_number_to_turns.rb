class AddColumnHoleNumberToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :hole_number, :integer
  end
end
