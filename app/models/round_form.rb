class RoundForm
  include ActiveModel::Model

  attr_accessor(
    :user_ids,
    :course_id,
    :round_factory,
    :current_user
  )

  def initialize(args: {}, round_factory: RoundRegistration)
    @user_ids = args["user_ids"]
    @current_user = args["current_user"]
    @course_id = args["course_id"]
    @round_factory = round_factory
  end

  def valid?
    course.present? && valid_friends?
  end

  def save
    round_factory.create_round(course: course, users: users)
  end

  private

  attr_reader :users, :course

  def valid_friends?
    User.where(id: user_ids).all? { |user| current_user.friends.include?(user) }
  end

  def course
    @course ||= Course.find_by(id: course_id)
  end

  def users
    @users ||= User.where(id: user_ids << current_user.id)
  end
end
