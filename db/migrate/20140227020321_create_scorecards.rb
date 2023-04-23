class CreateScorecards < ActiveRecord::Migration[4.2]
  def change
    create_table :scorecards do |t|
      t.integer :round_id
      t.integer :user_id

      t.timestamps
    end
  end
end
