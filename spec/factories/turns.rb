FactoryGirl.define do
  factory :turn do
    scorecard
    hole
    score nil
    par 3
  end
end
