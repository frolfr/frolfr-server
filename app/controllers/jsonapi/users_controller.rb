class Jsonapi::UsersController < Jsonapi::ResourceController
  def index
    if params['me']
      if user = context[:current_user]
        render json: serialize(user), status: :ok
      else
        render json: {}, status: 404
      end
    else
      super
    end
  end

  private

  def serialize(user, serializer: Jsonapi::UserResource)
    JSONAPI::ResourceSerializer.new(serializer).serialize_to_hash(serializer.new(user, nil))
  end
end
