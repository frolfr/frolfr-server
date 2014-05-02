class Hole < ActiveRecord::Base
  belongs_to :course

  has_many :turns

  validates :course, :number, presence: true
  validates_uniqueness_of :number, scope: :course
  validates :number, inclusion: { in: (1..27) }

  default_scope { order('number ASC') }

  def average_score(user)
    turns = played_turns_for_user(user)
    return nil if turns.count.zero?
    turns.sum(:score) / turns.count.to_f
  end
  private

  def played_turns_for_user(user)
    turns
      .joins(:scorecard)
      .where(scorecards: { user_id: user.id })
      .played
  end
end
