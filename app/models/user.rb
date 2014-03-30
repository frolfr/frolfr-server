class User < ActiveRecord::Base
  has_secure_password
  has_many :scorecards

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true
  before_create { generate_token(:auth_token) }


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
