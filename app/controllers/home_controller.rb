class HomeController < ApplicationController
  def show
    @course = Course.find_by(name: "Perkerson Park").decorate
    @users = %w(Geoff Jenna Hymen Jason)
  end
end
