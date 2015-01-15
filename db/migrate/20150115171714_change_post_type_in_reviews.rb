class ChangePostTypeInReviews < ActiveRecord::Migration
  def up
    change_column :reviews, :post, :text
  end

  def down
    change_column :reviews, :post, :string
  end
end
