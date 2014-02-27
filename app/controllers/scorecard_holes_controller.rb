class ScorecardHolesController < ApplicationController
  def update
    scorecard_hole = ScorecardHole.find(params[:id])
    scorecard_hole.update(score: params[:scorecard_hole][:score])

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Scorecard was successfully updated.' }
      format.json { respond_with_bip(scorecard_hole) }
    end
  end
end
