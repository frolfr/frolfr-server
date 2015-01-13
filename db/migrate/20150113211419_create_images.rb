class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string :url
      t.references :uploader, index: true

      t.timestamps
    end
  end
end
