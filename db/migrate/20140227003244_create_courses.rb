class CreateCourses < ActiveRecord::Migration
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
