class HomeController < ApplicationController
  def show
    @users = %w(Geoff Jenna Hymen Jason)
  end
end
