class ScorecardHolesController < ApplicationController
  def show
    @scorecard_hole = ScorecardHole.find(params[:id]).decorate
    @round = @scorecard_hole.round
  end
end
