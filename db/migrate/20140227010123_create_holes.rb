class CreateHoles < ActiveRecord::Migration[4.2]
  def change
    create_table :holes do |t|
      t.integer :number
      t.integer :course_id

      t.timestamps
    end
  end
end
