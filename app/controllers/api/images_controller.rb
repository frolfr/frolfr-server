class Api::ImagesController < ApplicationController
  respond_to :json

  def index
    images = Image.where(id: params[:ids])

    respond_with :api, images
  end

  def show
    image = Image.find(params[:id])

    respond_with :api, image
  end
end
