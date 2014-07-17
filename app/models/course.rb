class Course < ActiveRecord::Base
  PENDING_STATUS = 'pending'
  APPROVED_STATUS = 'approved'
  STATUSES = [PENDING_STATUS, APPROVED_STATUS].freeze

  has_many :holes, dependent: :destroy
  has_many :rounds

  validates :state, :city, :country, :name, :status, presence: true
  validates_uniqueness_of :name, scope: :city
  validates :status, inclusion: STATUSES

  scope :by_name, -> { order(:name) }

  def image
    "https://s3.amazonaws.com/frolfr/#{IMAGES[name]}"
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
