class Api::ScorecardsController < ActionController::Base

  respond_to :json

  def show
    scorecard = Scorecard.find params[:id]
    respond_with scorecard
  end
end
