class User < ApplicationRecord
  has_secure_password
  has_many :collections
  # Probably don't need this but what the hell...
  # has_many :items, through: :collections

  validates_presence_of :email, :first_name, :last_name
  validates :email, format: { with: /\A[^@]+@[^@]+\.[^@]+\z/,
                    message: "must have an @ symbol and period." }
end
