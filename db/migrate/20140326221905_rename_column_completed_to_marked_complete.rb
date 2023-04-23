class RenameColumnCompletedToMarkedComplete < ActiveRecord::Migration[4.2]
  def change
    rename_column :rounds, :completed, :marked_complete
  end
end
