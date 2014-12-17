class Api::RoundsController < ApplicationController

  respond_to :json

  def show
    round = Round.find(params[:id])
    respond_with round
  end

  def create
    user_ids = params[:round][:players] || []).map{|p| p[:id]}
    course_ids = params[:round][:course_id]

    round_params = { "user_ids" => user_ids, "current_user" => current_user, "course_id" => course_ids }

    respond_with :api, RoundForm.new(args: round_params).save
  end
end
