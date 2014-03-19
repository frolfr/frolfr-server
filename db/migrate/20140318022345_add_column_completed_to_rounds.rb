class AddColumnCompletedToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :completed, :boolean, default: false
  end
end
