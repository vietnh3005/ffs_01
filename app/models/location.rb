class Location < ApplicationRecord
  has_many :locations

  belongs_to :shop
end
