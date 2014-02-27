class Course < ActiveRecord::Base
  has_many :holes
  has_many :rounds

  validates :state, :city, :country, :name, presence: true
  validates_uniqueness_of :name, scope: :city
end
