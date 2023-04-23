class CreateScorecardHoles < ActiveRecord::Migration[4.2]
  def change
    create_table :turns do |t|
      t.integer :scorecard_id
      t.integer :hole_id
      t.integer :score

      t.timestamps
    end
  end
end
