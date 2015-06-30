class ReviewPolicy < ApplicationPolicy
  def create?
    played_course?
  end

  def update?
    record.user == user && played_course?
  end

  private

  def played_course?
    user.courses_played.include?(record.course)
  end
end
