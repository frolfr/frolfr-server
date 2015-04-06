class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :taken_at

  def taken_at
    if object.uploaded_through_round?
      object.imageable.created_at
    else
      object.created_at
    end
  end
end