class Category < ApplicationRecord
  before_save :capitalize_name

  scope :sort_by_create_at, -> {order created_at: :desc}

  has_many :products, through: :category_products
  has_many :category_products, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}

  private
  def capitalize_name
    name.capitalize!
  end
end
