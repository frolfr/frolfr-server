# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course1 = Course.create(
  name: "Perkerson Park",
  city: "Atlanta",
  state: "GA",
  country: "United States"
)

FIRST_HOLE = 1
TOTAL_HOLES = 18

FIRST_HOLE.upto(TOTAL_HOLES) do |i|
  Hole.create(number: i, course: course1)
  Hole.create(number: i, course: course2)
end
