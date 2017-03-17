class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :unit_quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validates :unit_price, presence: true,
    numericality: {only_decimal: true, greater_than: 0}
  validate :product_present
  validate :order_present
  before_save :finalize
  after_destroy :update_order_price

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total
    unit_price * unit_quantity
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
  end

  def update_order_price
    order[:total] = order.subtotal
    order.save
  end
end
