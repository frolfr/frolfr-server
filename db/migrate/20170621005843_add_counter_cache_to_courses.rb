class AddCounterCacheToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :holes_count, :integer
  end
end
