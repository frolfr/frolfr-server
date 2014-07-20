class LeaderboardsController < ApplicationController
  def show
    course = Course.find(params[:course_id]).decorate

    scorecards = course.scorecards.by_shooting
    best_scorecards = scorecards.select(&:completed?)
    @scorecards = ScorecardDecorator.decorate_collection(best_scorecards[0..9])
    # TODO: Clean up by_shooting, limiting
  end
end
