class Course < ActiveRecord::Base
  has_many :holes

  validates :state, :city, :country, :name, presence: true

  def total_holes
    holes.count
  end
end
