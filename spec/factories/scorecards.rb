FactoryGirl.define do
  factory :scorecard do
    first_name 'John'
    last_name  'Doe'
    age        { 1 + rand(100) }
  end
end
