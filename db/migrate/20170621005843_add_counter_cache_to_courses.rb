class AddCounterCacheToCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :holes_count, :integer
  end
end
