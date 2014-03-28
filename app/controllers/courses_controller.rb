class CoursesController < ApplicationController
  def index
    @courses = Course.all.decorate
  end

end
