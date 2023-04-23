class AddGeocodingColumnsToCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :latitude, :float
    add_column :courses, :longitude, :float
    add_column :courses, :address, :string
  end
end
