# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course = Course.create(
  name: "Perkerson Park",
  city: "Atlanta",
  state: "GA",
  country: "United States"
)

FIRST_HOLE = 1
LAST_HOLE = 18

FIRST_HOLE.upto(LAST_HOLE) do |i| 
  Hole.create(number: i, course: course)
end

round = Round.create(course: course)

users = User.create([
  { name: "Geoff", email: "geoff@frolfr.com" },
  { name: "Jenna", email: "jenna@frolfr.com" },
  { name: "Hymen", email: "hymen@frolfr.com" },
  { name: "Jason", email: "jason@frolfr.com" }
])

users.each do |user|
  scorecard = Scorecard.create(user: user, round: round)
  
  FIRST_HOLE.upto(LAST_HOLE) do |i|
    hole = Hole.find_by(number: i)
    ScorecardHole.create(
      scorecard: scorecard,
      score: nil,
      hole: hole
    )
  end
end

