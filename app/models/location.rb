class Location < ApplicationRecord
  has_many :locations

  belongs_to :shop
  belongs_to :user
  belongs_to :order
end
