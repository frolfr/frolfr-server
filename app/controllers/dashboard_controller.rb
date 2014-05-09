class DashboardController < ApplicationController
  def show
    scorecard = current_user.scorecards.last
    @scorecard = scorecard.decorate if scorecard
  end
end
