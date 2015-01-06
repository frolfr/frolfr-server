class Api::AvatarsController < ApplicationController
  respond_to :json

  def create
    upload = Cloudinary::Uploader.upload(params[:file])

    current_user.update(avatar_url: upload['url'])

    respond_with :api, current_user
  end
end
