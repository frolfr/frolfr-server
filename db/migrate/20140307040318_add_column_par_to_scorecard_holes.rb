class AddColumnParToScorecardHoles < ActiveRecord::Migration
  def change
    add_column :scorecard_holes, :par, :integer, default: 3
    add_index :scorecard_holes, :par
  end
end
