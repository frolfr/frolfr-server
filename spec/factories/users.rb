FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Dylan"
    sequence(:email) {|n| "#{n}@frolfr.com" }
    password "password"
    password_confirmation "password"
  end
end
