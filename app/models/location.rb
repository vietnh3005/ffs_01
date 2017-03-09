class Location < ApplicationRecord
  acts_as_tree

  has_many :shops
end
