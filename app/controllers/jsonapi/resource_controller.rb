class Jsonapi::ResourceController < Jsonapi::BaseController
  include JSONAPI::ActsAsResourceController

  def context
    { current_user: current_user }
  end
end
