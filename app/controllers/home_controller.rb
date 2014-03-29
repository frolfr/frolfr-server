class HomeController < ApplicationController
  def show
    @scorecards = current_user.scorecards.by_date.decorate
  end
end
