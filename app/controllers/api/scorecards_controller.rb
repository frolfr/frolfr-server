class Api::ScorecardsController < ApplicationController
  respond_to :json

  def index
    scorecards = Scorecard.find(params[:ids])
    respond_with scorecards
  end

  def show
    scorecard = Scorecard.find(params[:id])
    respond_with scorecard
  end
end
