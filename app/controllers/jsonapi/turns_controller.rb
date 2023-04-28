module Jsonapi
  class TurnsController < Jsonapi::ResourceController
    before_action :authenticate_request
  end
end
