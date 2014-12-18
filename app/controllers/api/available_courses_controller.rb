class Api::AvailableCoursesController < ApplicationController
  respond_to :json

  def index
    respond_with :api, Course.available_to(current_user).by_name
  end
end
