class Api::ScorecardsController < ApplicationController
  respond_to :json

  def show
    scorecard = Scorecard.find(params[:id])
    respond_with scorecard
  end
end
