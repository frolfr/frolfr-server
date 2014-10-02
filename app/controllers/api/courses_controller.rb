class Api::CoursesController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.courses_played
  end
end
