class AddColumnCompletedToRounds < ActiveRecord::Migration[4.2]
  def change
    add_column :rounds, :completed, :boolean, default: false
  end
end
