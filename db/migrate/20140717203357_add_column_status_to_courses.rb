class AddColumnStatusToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :status, :string, default: 'pending'
    add_column :courses, :submitter_id, :integer
  end
end
