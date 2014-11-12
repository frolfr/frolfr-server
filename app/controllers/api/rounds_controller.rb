class Api::RoundsController < ActionController::Base

  respond_to :json

  def show
    round = Round.find params[:id]
    respond_with round
  end

end
