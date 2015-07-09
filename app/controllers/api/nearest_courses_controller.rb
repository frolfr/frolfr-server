class Api::NearestCoursesController < ApplicationController
  respond_to :json

  def index
    if location_provided?
      current_location = CurrentLocation.new(longitude: params[:longitude], latitude: params[:latitude])

      respond_with current_location.nearby_courses.first(3)
    else
      head :unprocessable_entity
    end
  end

  private

  def location_provided?
    params[:longitude].present? && params[:latitude].present?
  end
end
