class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  scope :sort_by_create_at, -> {order created_at: :desc}

  has_many :orders
  has_one :location
end
