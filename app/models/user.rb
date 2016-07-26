class User < ApplicationRecord
  has_secure_password
  has_many :collections
  # Probably don't need this but what the hell...
  # has_many :items, through: :collections

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[^@]+@[^@]+\.[^@]+\z/,
                      message: "must have an @ symbol and period." }
  validates :access_token, presence: true

  def ensure_access_token
    unless self.access_token
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
