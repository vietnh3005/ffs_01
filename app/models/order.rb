class Order < ApplicationRecord
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy
  has_one :location

  belongs_to :discount
  belongs_to :shop
end
