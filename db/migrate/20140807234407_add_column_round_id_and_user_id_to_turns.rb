class AddColumnRoundIdAndUserIdToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :round_id, :integer
    add_column :turns, :user_id, :integer
    add_index :turns, :round_id
    add_index :turns, :user_id
  end
end
