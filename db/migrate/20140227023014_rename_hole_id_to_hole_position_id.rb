class RenameHoleIdToHolePositionId < ActiveRecord::Migration
  def change
    rename_column :scorecard_holes, :hole_id, :hole_position_id
  end
end
