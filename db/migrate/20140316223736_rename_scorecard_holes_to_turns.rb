class RenameScorecardHolesToTurns < ActiveRecord::Migration
  def change
    rename_table :scorecard_holes, :turns
  end
end
