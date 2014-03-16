class RenameScorecardHolesToTurns < ActiveRecord::Migration
  def change
    rename_table :turns, :turns
  end
end
