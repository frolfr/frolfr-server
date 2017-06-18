class Jsonapi::TurnResource < JSONAPI::Resource
  # TODO Ideally hole_number becomes a column on turns table. As is
  # this will cause n+1 queries
  attributes :hole_number, :par, :strokes

  paginator :none
end
