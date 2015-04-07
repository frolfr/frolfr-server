class Api::AvatarsController < ApplicationController
  respond_to :json

  def create
    upload = Cloudinary::Uploader.upload(params[:file],
      width: 200,
      height: 200,
      crop: :thumb,
      gravity: :faces
    )

    current_user.update(avatar_url: upload['url'])

    respond_with :api, current_user
  end
end
