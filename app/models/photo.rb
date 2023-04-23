class Photo < ApplicationRecord
  belongs_to :photoable, polymorphic: true
  belongs_to :uploader, class_name: 'User'

  def uploaded_through_round?
    photoable_type == 'Round'
  end
end
