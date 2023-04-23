class AddColumnPublicRecapToRounds < ActiveRecord::Migration[4.2]
  def change
    add_column :rounds, :public_recap, :boolean, default: false, null: false
  end
end
