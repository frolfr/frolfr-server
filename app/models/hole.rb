class Hole < ActiveRecord::Base

  validates :course, :number, presence: true
  validates :number, uniqueness: true
  validates :number, inclusion: { in: (1..27) }
end
