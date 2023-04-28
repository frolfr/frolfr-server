module Jsonapi
  class ScorecardsController < Jsonapi::ResourceController
    before_action :authenticate_request
  end
end
