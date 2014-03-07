class ScorecardHolesController < ApplicationController
  def show
    @scorecard_hole = ScorecardHole.find(params[:id]).decorate
    @round = @scorecard_hole.round
  end

  def update
    scorecard_hole = ScorecardHole.find(params[:id])
    scorecard_hole.update(update_params)

    respond_to do |format|
      format.mobile { render json: {total: 0, shooting: 0} }
    end
  end

  private

  def update_params
    params.permit(:score, :par)
  end
end
