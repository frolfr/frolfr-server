class DashboardController < ApplicationController
  def show
    @scorecard = current_user.scorecards.last.decorate
  end
end
