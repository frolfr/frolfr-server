class AddColumnRatingToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :rating, :float
  end
end
