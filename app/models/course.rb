class Course < ActiveRecord::Base
  PENDING_STATUS = 'pending'
  APPROVED_STATUS = 'approved'
  STATUSES = [PENDING_STATUS, APPROVED_STATUS].freeze

  has_many :holes, dependent: :destroy
  has_many :rounds
  belongs_to :submitter, class_name: "User"

  validates :state, :city, :country, :name, :status, presence: true
  validates_uniqueness_of :name, scope: :city
  validates :status, inclusion: STATUSES
  validates :state, inclusion: States.abbreviations

  scope :by_name, -> { order(:name) }
  scope :approved, -> { where(status: APPROVED_STATUS) }

  def hole_one
    holes.find_by(number: "1")
  end

  def scorecards
    Scorecard
      .joins(:round)
      .where(rounds: { course_id: id })
  end

  def image_url
    "https://s3.amazonaws.com/frolfr/#{image_path}"
  end

  def image_available?
    image_path.present?
  end

  def image_path
    IMAGES[name]
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
