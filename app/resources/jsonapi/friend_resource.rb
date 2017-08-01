class Jsonapi::FriendResource < JSONAPI::Resource
  model_name 'Friendship'

  attributes :created_at

  has_one :user
  has_one :friend, class_name: "User"
end
