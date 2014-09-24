# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
  first_name: 'Frolfr',
  last_name: 'Champ',
  password: 'password',
  password_confirmation: 'password'
)
friend = User.create(
  first_name: 'New',
  last_name: 'Discr',
  password: 'password',
  password_confirmation: 'password'
)

course = Course.create(
  name: "Perkerson Park",
  city: "Atlanta",
  state: "GA",
  country: "United States"
)

1.upto(18) do |number|
  Hole.create(number: number, course: course)
end
