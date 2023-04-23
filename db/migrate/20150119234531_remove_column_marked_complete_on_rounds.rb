class RemoveColumnMarkedCompleteOnRounds < ActiveRecord::Migration[4.2]
  def change
    remove_column :rounds, :marked_complete, :boolean
  end
end
