class User < ActiveRecord::Base
  has_secure_password
  has_many :scorecards

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
