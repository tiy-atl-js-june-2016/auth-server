class Item < ApplicationRecord
  belongs_to :collection
  serialize :data, JSON
end
