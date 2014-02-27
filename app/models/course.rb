class Course < ActiveRecord::Base
  has_many :holes

  validates :state, :city, :country, :name, presence: true
end
