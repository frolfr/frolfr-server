class Api::TurnsController < ActionController::Base

  respond_to :json

  def show
    turn = Turn.find(params[:id])
    respond_with turn
  end

end
