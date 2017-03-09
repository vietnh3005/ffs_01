class Order < ApplicationRecord
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy

  belongs_to :discount, optional: true
  belongs_to :shop, optional: true
  belongs_to :user, optional: true

  enum status: [:waiting, :accepted, :rejected, :finished]
  scope :unassign, -> {where shop_id: nil}
end
