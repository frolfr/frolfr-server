class Hole < ActiveRecord::Base
  DEFAULT_PAR = 3
  belongs_to :course, counter_cache: true

  has_many :turns

  validates :course, :number, presence: true
  validates_uniqueness_of :number, scope: :course
  validates :number, inclusion: { in: (1..27) }

  default_scope { order('number ASC') }

  def par
    most_recent_par || DEFAULT_PAR
  end

  private

  def most_recent_par
    turns.last.try(:par)
  end
end
