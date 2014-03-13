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
  private
  def reject_empty(ids)
    ids.present? && ids.reject(&:empty?)
  end
end
