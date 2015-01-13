class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  belongs_to :uploader, class: 'User'
end
