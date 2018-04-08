class Jsonapi::TurnResource < JSONAPI::Resource
  attributes :hole_number, :par, :strokes
  has_one :scorecard

  def self.updatable_fields(_)
    super - [:holes_count]
  end

  def self.creatable_fields(_)
    super - [:holes_count]
  end

  paginator :none
end
