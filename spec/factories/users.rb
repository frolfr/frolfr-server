FactoryGirl.define do
  factory :user, aliases: [:friend] do
    first_name "Bob"
    sequence(:last_name) {|n| "Dylan#{n}" }
    sequence(:email) {|n| "#{n}@frolfr.com" }
    password "password"
    password_confirmation "password"
  end
end
