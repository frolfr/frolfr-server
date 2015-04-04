class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  belongs_to :uploader, class_name: 'User'

  def uploaded_through_round?
    imageable_type == 'Round'
  end
end
