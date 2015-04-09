class Api::PhotosController < ApplicationController
  respond_to :json

  def index
    photos = Photo.where(id: params[:ids])

    respond_with :api, photos
  end

  def show
    photo = Photo.find(params[:id])

    respond_with :api, photo
  end
end
