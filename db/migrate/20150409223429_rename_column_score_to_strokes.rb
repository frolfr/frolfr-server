class RenameColumnScoreToStrokes < ActiveRecord::Migration
  def change
    rename_column :turns, :score, :strokes
  end
end
