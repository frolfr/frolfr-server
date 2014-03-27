class RenameColumnCompletedToMarkedComplete < ActiveRecord::Migration
  def change
    rename_column :rounds, :completed, :marked_complete
  end
end
