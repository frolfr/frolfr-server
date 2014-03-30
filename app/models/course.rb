class Course < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  has_many :rounds

  validates :state, :city, :country, :name, presence: true
  validates_uniqueness_of :name, scope: :city

  IMAGES = {
    "Perkerson Park" => "perkerson.jpg",
    "Redan Park" => "redan.jpg"
  }.freeze

  def image
    IMAGES[name]
  end
  end
end
