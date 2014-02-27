class HolePosition < ActiveRecord::Base
  validates :par, :hole, presence: true
end
