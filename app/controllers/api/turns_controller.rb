class Api::TurnsController < ApplicationController

  respond_to :json

  def show
    turn = Turn.find(params[:id])
    respond_with turn
  end

  def index
    round = Round.find(params[:round_id])
    hole = round.holes.find_by(number: params[:hole_number])

    turns = round.turns_for_hole(hole)
    respond_with turns
  end
end
