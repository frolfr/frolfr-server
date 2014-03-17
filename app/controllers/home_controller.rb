class HomeController < ApplicationController
  def show
    @scorecards = current_user.scorecards.decorate
  end
end
