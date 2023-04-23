class CreateRounds < ActiveRecord::Migration[4.2]
  def change
    create_table :rounds do |t|
      t.integer :course_id

      t.timestamps
    end
  end
end
