class Api::CurrentRoundsController < ApplicationController
  respond_to :json

  def show
    respond_with current_user.current_round
  end
end
