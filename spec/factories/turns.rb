FactoryBot.define do
  factory :turn do
    scorecard
    hole
    strokes { nil }
    par { 3 }
    hole_number { 1 }
  end
end
