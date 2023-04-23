class AddColumnParToScorecardHoles < ActiveRecord::Migration[4.2]
  def change
    add_column :turns, :par, :integer, default: 3
    add_index :turns, :par
  end
end
