FactoryBot.define do
  factory :course do
    state { 'GA' }
    city { 'Atlanta' }
    sequence(:name) { |n| "Course #{n}" }
    country { 'USA' }
    association :submitter, factory: :user
  end
end
