class Api::ScorecardsController < ApplicationController
  respond_to :json

  def index
    scorecards = Scorecard.find(params[:ids])
    respond_with scorecards
  end

  def create
    @scorecard = Scorecard.new(scorecard_params)

    if @scorecard.save
      create_turns!
      respond_with :api, @scorecard
    end
  end

  def show
    scorecard = Scorecard.find(params[:id])
    respond_with scorecard
  end

  private

  def create_turns!
    @scorecard.course.holes.each do |hole|
      Turn.create(hole: hole, scorecard: @scorecard, par: hole.par)
    end
  end

  def scorecard_params
    params.require(:scorecard).permit(:round_id, :user_id)
  end
end
