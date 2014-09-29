# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Course.destroy_all
Round.destroy_all

User.create(
  first_name: 'Frolfr',
  last_name: 'Champ',
  password: 'password',
  email: 'champ@frolfr.com',
  password_confirmation: 'password'
)

User.create(
  first_name: 'New',
  last_name: 'Discr',
  password: 'password',
  email: 'newb@frolfr.com',
  password_confirmation: 'password'
)

course = Course.create(
  name: "Perkerson Park",
  city: "Atlanta",
  state: "GA",
  country: "United States"
)

1.upto(18) do |number|
  course.holes.create(number: number)
end

round = Round.create(
  course: course,
  marked_complete: true
)

User.all.each do |user|
  Scorecard.create(
    round: round,
    user: user
  )
end

Scorecard.all.each do |scorecard|
  course.holes.each do |hole|
    scorecard.turns.create(
      hole: hole,
      score: (2..6).to_a.sample
    )
  end
end

