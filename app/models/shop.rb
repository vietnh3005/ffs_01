class Shop < ApplicationRecord
  has_many :staffs, dependent: :destroy
  has_many :orders
  has_one :location
end
