User.destroy_all
Course.destroy_all
Round.destroy_all

User.create(
  first_name: 'Jordan',
  last_name: 'Killpack',
  password: 'password',
  email: 'jordan@frolfr.com',
  password_confirmation: 'password'
)

User.create(
  first_name: 'Don',
  last_name: 'Pottinger',
  password: 'password',
  email: 'don@frolfr.com',
  password_confirmation: 'password'
)

User.create(
  first_name: 'Patrick',
  last_name: 'Dougall',
  password: 'password',
  email: 'patrick@frolfr.com',
  password_confirmation: 'password'
)

User.create(
  first_name: 'Sebastian',
  last_name: 'Geiger',
  password: 'password',
  email: 'sebastian@frolfr.com',
  password_confirmation: 'password'
)

chris = User.create!(
  first_name: 'Chris',
  last_name: 'McCuller',
  password: 'password',
  email: 'chris@frolfr.com',
  password_confirmation: 'password'
)

User.all.each do |user|
  User.all.each do |friend|
    Friendship.create_friendship(user: user, friend: friend)
  end
end

course = Course.create!(
  name: 'Perkerson Park',
  city: 'Atlanta',
  state: 'GA',
  country: 'United States',
  status: 'approved',
  submitter: chris
)

course2 = Course.create!(
  name: 'Redan Park',
  city: 'Lithonia',
  state: 'GA',
  country: 'United States',
  status: 'approved',
  submitter: chris
)

1.upto(18) do |number|
  course.holes.create(number: number)
  course2.holes.create(number: number)
end

5.times do
  day = (1..365).to_a.sample
  round = Round.create(
    course: course,
    created_at: day.days.ago
  )
  User.all.each do |user|
    scorecard = Scorecard.create(
      round: round,
      user: user
    )
    course.holes.each do |hole|
      scorecard.turns.create(
        hole: hole,
        strokes: (2..4).to_a.sample,
        hole_number: hole.number
      )
    end
  end
end

5.times do
  day = (1..365).to_a.sample
  round = Round.create(
    course: course2,
    created_at: day.days.ago
  )
  User.all.each do |user|
    scorecard = Scorecard.create(
      round: round,
      user: user
    )
    course2.holes.each do |hole|
      scorecard.turns.create(
        hole: hole,
        strokes: (2..4).to_a.sample,
        hole_number: hole.number
      )
    end
  end
end
