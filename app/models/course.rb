class Course < ActiveRecord::Base
  has_many :holes
  has_many :rounds

  validates :state, :city, :country, :name, presence: true
  validates_uniqueness_of :name, scope: :city

  IMAGES = {
    Course.find_by(name: "Perkerson Park") => "http://www.dgcoursereview.com/course_pics/2590/da413035_m.jpg",
    Course.find_by(name: "Redan Park") => "http://www.pdga.com/files/styles/large/public/course_photos/REDAN%20SIGN.jpg"
  }.freeze

  def image
    IMAGES[self]
  end
end
