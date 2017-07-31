class Jsonapi::FriendResource < JSONAPI::Resource
  attributes :created_at

  has_one :user
end
