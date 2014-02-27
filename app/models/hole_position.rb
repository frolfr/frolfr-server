class HolePosition < ActiveRecord::Base
  validates :par, :hole, presense: true
end
