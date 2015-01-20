class Api::RoundsController < ApplicationController

  respond_to :json

  def index
    rounds = Round.find(params[:ids])
    respond_with rounds
  end

  def show
    round = Round.find(params[:id])
    respond_with round
  end

  def create
    user_ids = (params[:round][:players] || []).map{|p| p[:id]}
    course_ids = params[:round][:course_id]

    round_params = { "user_ids" => user_ids, "current_user" => current_user, "course_id" => course_ids }

    respond_with :api, RoundForm.new(args: round_params).save
  end

  def update
    round = Round.find(params[:id])

    if round.update(round_params)
      respond_with round
    end
  end

  def destroy
    round = Round.find(params[:id])

    if round.started?
      head :unprocessable_entity
    else
      round.destroy
      respond_with round
    end
  end

  private

  def round_params
    params.require(:round).permit(:public_recap)
  end
end
