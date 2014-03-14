class HomeController < ApplicationController
  def show
    @rounds = Round.all.decorate
  end
end
