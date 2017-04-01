class Jsonapi::UserResource < JSONAPI::Resource
  attributes :email, :first_name, :middle_name, :last_name, :avatar_url
end
