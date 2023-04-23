class AddCourseIdAndUserIdToReviews < ActiveRecord::Migration[4.2]
  def change
    add_column :reviews, :course_id, :integer
    add_column :reviews, :user_id, :integer
  end
end
