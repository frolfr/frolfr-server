class ScorecardHolesController < ApplicationController
  def update
    scorecard_hole = ScorecardHole.find(params[:id])
    scorecard_hole.update(score: params[:scorecard_hole][:score])
    path = params[:scorecard_hole][:locale] == 'de' ? root_path(locale: 'de') : root_path

    respond_to do |format|
      format.html { redirect_to path, notice: 'Scorecard was successfully updated.' }
    end
  end
end
