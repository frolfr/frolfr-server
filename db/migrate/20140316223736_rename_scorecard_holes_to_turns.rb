class RenameScorecardHolesToTurns < ActiveRecord::Migration[4.2]
  def change
    rename_table :turns, :turns
  end
end
