class Hole < ActiveRecord::Base
  belongs_to :course

  has_many :turns

  validates :course, :number, presence: true
  validates_uniqueness_of :number, scope: :course
  validates :number, inclusion: { in: (1..27) }

  default_scope { order('number ASC') }

end
