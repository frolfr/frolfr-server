class HolePosition < ActiveRecord::Base
  belongs_to :hole

  validates :par, :hole, presence: true
end
