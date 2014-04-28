class User < ActiveRecord::Base
  has_secure_password
  has_many :scorecards
  has_many :friendships
  has_many :friends, through: :friendships

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true
  before_create { generate_token(:auth_token) }

  scope :by_name, -> { order(:first_name, :last_name) }

  def friendable_users
    User.all - friends
  end

  def courses_played
    ids = rounds.map(&:course_id)
    courses = Course.where(id: ids).by_name # TODO: Consider refactor / another approach!
  end

  def rounds
    scorecards.map(&:round)
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
