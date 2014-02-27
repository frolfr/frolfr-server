class CreateScorecardHoles < ActiveRecord::Migration
  def change
    create_table :scorecard_holes do |t|
      t.integer :scorecard_id
      t.integer :hole_id
      t.integer :score

      t.timestamps
    end
  end
end
