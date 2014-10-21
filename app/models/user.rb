class User < ActiveRecord::Base
  has_secure_password
  has_many :scorecards
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  auto_strip_attributes :first_name, :last_name, :email, :middle_name, squish: true

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true
  before_create { generate_token(:auth_token) }

  scope :by_name, -> { order(:first_name, :last_name) }

  def self.find_for_authentication(email)
    where('lower(email) = lower(?)', email).first
  end

  def rounds_with_user(user)
    rounds.select do |round|
      round.scorecards.any? {|scorecard| scorecard.user_id == user.id }
    end
    # TODO: Refactor
  end

  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  def recently_completed_scorecard
    scorecards_by_date.completed.first || NullScorecard.new
  end

  def friends_by_name
    friends.by_name
  end

  def friendable_users
    User.where.not(id: id) - friends
  end

  def courses_played
    ids = rounds.pluck(:course_id)
    Course.where(id: ids).by_name # TODO: Consider refactor / another approach!
  end

  def rounds
    Round
      .joins(:scorecards)
      .where(scorecards: {user_id: id}) # TODO: Refactor to use ActiveRecord
  end

  def scorecards_by_date
    scorecards.by_date
  end

  def scorecards_for_course(course)
    scorecards
      .joins(:round)
      .where(rounds: {course_id: course.id })
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
