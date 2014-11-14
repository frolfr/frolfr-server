class Api::HolesController < ApplicationController
  respond_to :json

  def show
    hole = Hole.find(params[:id])
    respond_with hole
  end

end
