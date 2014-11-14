class Api::RoundsController < ApplicationController
  respond_to :json

  def show
    round = Round.find(params[:id])
    respond_with round
  end
end
