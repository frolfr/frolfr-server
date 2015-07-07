class AddGeocodingColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :latitude, :float
    add_column :courses, :longitude, :float
    add_column :courses, :address, :string
  end
end
