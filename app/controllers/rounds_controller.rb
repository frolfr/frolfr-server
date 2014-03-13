class RoundsController < ApplicationController
  def new
    @round_form = RoundForm.new
  end

end
