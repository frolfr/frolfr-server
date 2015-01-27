class AddColumnPublicRecapToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :public_recap, :boolean, default: false, null: false
  end
end
