class Hole < ActiveRecord::Base
  belongs_to :course
  has_many :hole_positions

  validates :course, :number, presence: true
  validates :number, uniqueness: true
  validates :number, inclusion: { in: (1..27) }
end
