class ScorecardHolesController < ApplicationController
  def show
    @scorecard_hole = ScorecardHole.find(params[:id]).decorate
    @round = @scorecard_hole.round
  end

  def update
    scorecard_hole = ScorecardHole.find(params[:id])
    scorecard_hole.update(update_params)
    scorecard = scorecard_hole.scorecard.decorate

    respond_to do |format|
      format.mobile { render json: {score: scorecard.display_score, id: scorecard.id} }
    end
  end

  private

  def update_params
    params.permit(:score, :par)
  end
end
