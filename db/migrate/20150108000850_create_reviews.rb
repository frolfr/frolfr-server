class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :post
      t.integer :rating

      t.timestamps
    end
  end
end
