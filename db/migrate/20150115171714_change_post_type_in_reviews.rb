class ChangePostTypeInReviews < ActiveRecord::Migration[4.2]
  def up
    change_column :reviews, :post, :text
  end

  def down
    change_column :reviews, :post, :string
  end
end
