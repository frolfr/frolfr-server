module Jsonapi
  class TurnsController < Jsonapi::ResourceController
    before_action :authenticate_request, except: %i[index show]
  end
end
