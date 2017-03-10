class Staff < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
  belongs_to :shop, required: false
  enum position: [:admin, :owner, :chef, :shipper]
  scope :sort_by_create_at, -> {order created_at: :desc}
end
