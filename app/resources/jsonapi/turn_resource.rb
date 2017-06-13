class Jsonapi::TurnResource < JSONAPI::Resource
  attributes :par, :strokes

  paginator :none
end
