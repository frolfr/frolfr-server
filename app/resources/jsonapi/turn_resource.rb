class Jsonapi::TurnResource < JSONAPI::Resource
  # TODO Ideally hole_number becomes a column on turns table. As is
  # this will cause n+1 queries
  attributes :hole_number, :par, :strokes
  has_one :scorecard

  # TODO self.updateable_fields will throw a 400. We'd rather just ignore this
  def hole_number=(_); end

  paginator :none
end
