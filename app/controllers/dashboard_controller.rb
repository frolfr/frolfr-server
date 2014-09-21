class DashboardController < ApplicationController
  def show
    @scorecard = current_user.recently_completed_scorecard.decorate
  end
end
