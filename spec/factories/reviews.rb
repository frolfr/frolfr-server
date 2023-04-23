FactoryBot.define do
  factory :review do
    course
    user
    rating { 5 }
    post { 'Great stuff' }
  end
end
