class Api::ProfileStatLogsController < ApplicationController
  respond_to :json

  def show
    respond_with :api, current_user, serializer: ProfileStatLogSerializer
  end
end
