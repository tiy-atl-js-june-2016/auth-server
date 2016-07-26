class Collection < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :title, presence: true
end
