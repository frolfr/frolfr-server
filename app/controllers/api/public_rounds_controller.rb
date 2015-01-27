class Api::PublicRoundsController < ApplicationController
  skip_filter :authenticate

  respond_to :json

  def show
    round = Round.find(params[:id])

    if round.public_recap?
      respond_with :api, round, serializer: PublicRoundSerializer
    else
      head :not_found
    end
  end
end
