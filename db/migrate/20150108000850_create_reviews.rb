class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
      t.string :post
      t.integer :rating

      t.timestamps
    end
  end
end
