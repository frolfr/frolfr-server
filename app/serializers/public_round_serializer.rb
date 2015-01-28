class PublicRoundSerializer < RoundSerializer
  has_many :scorecards, each_serializer: PublicScorecardSerializer
end
