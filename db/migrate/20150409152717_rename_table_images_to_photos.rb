class RenameTableImagesToPhotos < ActiveRecord::Migration
  def change
    rename_column :images, :imageable_id, :photoable_id
    rename_column :images, :imageable_type, :photoable_type

    rename_table :images, :photos
  end
end
