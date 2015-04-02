class User < ActiveRecord::Base
  has_secure_password
  has_many :scorecards, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  auto_strip_attributes :first_name, :last_name, :email, :middle_name, squish: true

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true
  before_create { generate_token(:auth_token) }

  scope :by_name, -> { order(:first_name, :last_name) }

  paginates_per 6

  def current_round
    round = rounds.by_date.first
    round if (round.created_today? && round.incomplete?)
  end

  def completed_scorecards
    scorecards.select(&:completed?)
  end

  def self.find_for_authentication(email)
    where('lower(email) = lower(?)', email).first
  end

  def rounds_with_user(user)
    round_ids = rounds.flat_map do |round|
      if round.scorecards.any? {|scorecard| scorecard.user_id == user.id }
        round.id
      end
    end

    Round.where(id: round_ids)
    # TODO: Refactor
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

  def scorecards_for_course(course)
    scorecards
      .joins(:round)
      .where(rounds: {course_id: course.id })
  end

  def update_password_reset_token!
    generate_token(:password_reset_token)
    touch(:password_reset_sent_at)

    save!
    UserMailer.password_reset(self).deliver
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
