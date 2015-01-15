class AddCourseIdAndUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :course_id, :integer
    add_column :reviews, :user_id, :integer
  end
end
