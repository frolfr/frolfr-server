module Jsonapi
  class CoursesController < Jsonapi::ResourceController
    before_action :authenticate_request
  end
end
