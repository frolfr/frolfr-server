class HomeController < ApplicationController
  def show
    @scorecards = current_user.scorecards_by_date.decorate
  end
end
