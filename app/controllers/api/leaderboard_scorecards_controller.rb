class Api::LeaderboardScorecardsController < ApplicationController
  respond_to :json

  def index
    course = Course.find(params[:course_id])
    leaderboard = Leaderboard.new(course)

    respond_with :api, leaderboard.scorecards, each_serializer: LeaderboardScorecardSerializer
  end
end
