class Course < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  has_many :rounds

  validates :state, :city, :country, :name, presence: true
  validates_uniqueness_of :name, scope: :city

  scope :by_name, -> { order(:name) }

  def image
    IMAGES[name]
  end

  def image_available?
    image.present?
  end

  private

  IMAGES = {
    "Perkerson Park" => "perkerson.jpg",
    "Redan Park" => "redan.jpg",
    "Anderson Valley" => "anderson_valley.jpg",
    "Roche Harbor" => "roche_harbor.jpg",
    "Golden Gate Park" => "ggp.jpg"
  }.freeze
end
