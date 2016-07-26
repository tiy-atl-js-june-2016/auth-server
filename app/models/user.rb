class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :first_name, :last_name
  validates :email, format: { with: /\A[^@]+@[^@]+\.[^@]+\z/,
                    message: "must have an @ symbol and period." }
end
