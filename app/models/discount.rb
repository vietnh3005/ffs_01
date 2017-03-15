class Discount < ApplicationRecord
  has_many :orders
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
  enum status: [:active, :inactive]
end
