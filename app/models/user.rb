class User < ApplicationRecord
  has_many :orders
  has_one :location
end
