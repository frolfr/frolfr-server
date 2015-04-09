FactoryGirl.define do
  factory :turn do
    scorecard
    hole
    strokes nil
    par 3
  end
end
