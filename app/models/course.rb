class Course < ActiveRecord::Base
  validates :state, :city, :country, :name, presence: true
end
