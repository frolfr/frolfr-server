class HomeController < ApplicationController
  def show
    @round = Round.first.decorate
  end
end
