class AddColumnRatingToCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :rating, :float
  end
end
