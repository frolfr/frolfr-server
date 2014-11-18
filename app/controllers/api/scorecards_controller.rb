class Api::ScorecardsController < ApplicationController
  respond_to :json

  def index
    scorecards = current_user.scorecards_by_date.limit(10)
    respond_with scorecards
  end

  def show
    scorecard = Scorecard.find(params[:id])
    respond_with scorecard
  end
end
