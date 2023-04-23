class AddIndexesToTables < ActiveRecord::Migration[4.2]
  def change
    add_index :holes, :course_id
    add_index :rounds, :course_id
    add_index :scorecards, :round_id
    add_index :scorecards, :user_id
    add_index :turns, :scorecard_id
    add_index :turns, :hole_id
  end
end
