class CreateCourses < ActiveRecord::Migration[4.2]
  def change
    create_table :courses do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
