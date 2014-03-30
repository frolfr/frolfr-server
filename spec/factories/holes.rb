FactoryGirl.define do
  factory :hole do
    sequence(:number) {|n| "#{n}" }
    course
  end
end
