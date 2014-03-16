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

course2 = Course.create(
  name: "Redan Park",
  city: "Lithonia",
  state: "GA",
  country: "United States"
)

FIRST_HOLE = 1
TOTAL_HOLES = 18

FIRST_HOLE.upto(TOTAL_HOLES) do |i| 
  Hole.create(number: i, course: course1)
  Hole.create(number: i, course: course2)
end

users = User.create([
  { name: "Geoff", email: "geoff@frolfr.com" },
  { name: "Jenna", email: "jenna@frolfr.com" },
  { name: "Hyman", email: "hyman@frolfr.com" },
  { name: "Jason", email: "jason@frolfr.com" },
  { name: "Felix", email: "felix@frolfr.com" },
  { name: "Phillips", email: "phillips@frolfr.com" }
])
