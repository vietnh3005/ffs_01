class Order < ApplicationRecord
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy

  belongs_to :discount, optional: true
  belongs_to :shop, optional: true
  belongs_to :user, optional: true

  enum status: [:waiting, :accepted, :rejected, :finished]
  scope :unassign, -> {where shop_id: nil}
  scope :assign, -> {where.not shop_id: nil}
  scope :sort_by_create_at, -> {order created_at: :desc}

  scope :shop_order, lambda { |staff|
    where("shop_id = ?", staff.shop_id)
  }

  scope :waiting_order, -> {where status: :waiting}

  before_create :init_order
  before_save :update_subtotal

  def subtotal
    order_details.collect {|order_detail| order_detail.valid? ?
    order_detail.total : Settings.min_total}.sum
  end

  private
  def init_order
    self[:total] = Settings.min_total
  end

  def update_subtotal
    self[:total] = subtotal
  end
end
