class Api::ReviewsController < ApplicationController
  respond_to :json

  def index
    reviews = Review.where(id: params[:ids])

    respond_with :api, reviews
  end

  def create
    review = Review.new(review_params)

    if review.save
      respond_with :api, review
    else
      head :unprocessable_entity
    end
  end

  private

  def review_params
    params
      .require(:review)
      .permit(:post, :rating)
      .merge({
        course: Course.find(params[:review][:course_id]),
        user: current_user
      })
  end

end

