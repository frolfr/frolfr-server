class RemoveColumnMarkedCompleteOnRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :marked_complete, :boolean
  end
end
