class CreateImages < ActiveRecord::Migration[4.2]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string :url
      t.references :uploader, index: true

      t.timestamps
    end
  end
end
