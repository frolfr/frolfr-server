class AddColumnStatusToCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :status, :string, default: 'pending'
    add_column :courses, :submitter_id, :integer
  end
end
