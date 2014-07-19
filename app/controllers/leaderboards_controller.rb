class LeaderboardsController < ApplicationController
  def show
    @course = Course.find(params[:course_id]).decorate
  end
end
