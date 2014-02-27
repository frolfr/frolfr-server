class Round < ActiveRecord::Base
  belongs_to :course

  validates :course, presence: true
end
