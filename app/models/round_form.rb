class RoundForm
  include ActiveModel::Model

  attr_accessor(
    :user_ids,
    :course_id,
    :round_factory
  )

  def initialize(args: {}, round_factory: RoundRegistration)
    @user_ids = reject_empty(args["user_ids"])
    @course_id = args["course_id"]
    @round_factory = round_factory
  end

  def valid?
    course.present? && users_found?
  end

  def save
    round_factory.create_round(course: course, users: users)
  end

  private

  attr_reader :users, :course

  def reject_empty(ids)
    ids.present? && ids.reject(&:empty?)
  end

  def users_found?
    users.count == user_ids.count && users.count > 0
  end

  def course
    @course ||= Course.find_by(id: course_id)
  end

  def users
    @users ||= User.where(id: user_ids)
  end
end
