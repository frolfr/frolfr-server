class RenameColumnScoreToStrokes < ActiveRecord::Migration[4.2]
  def change
    rename_column :turns, :score, :strokes
  end
end
