class Api::CourseImagesController < ApplicationController
  respond_to :json

  def create
    @course = Course.find(params[:course_id])

    upload = Cloudinary::Uploader.upload(params[:file])

    @image = @course.images.create(url: upload['url'], uploader: current_user)

    respond_with @image, location: api_course_course_images_path(course: @course)
  end
end
