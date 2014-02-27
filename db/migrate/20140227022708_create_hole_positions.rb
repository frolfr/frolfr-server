class CreateHolePositions < ActiveRecord::Migration
  def change
    create_table :hole_positions do |t|
      t.integer :hole_id
      t.string :name
      t.integer :par

    end
  end
end
