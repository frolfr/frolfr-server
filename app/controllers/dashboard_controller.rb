class DashboardController < ApplicationController
  def show
    scorecard = current_user.recently_completed_scorecard
    @scorecard = scorecard.decorate if scorecard
    @dashboard = Dashboard.new(current_user).decorate
  end
end
