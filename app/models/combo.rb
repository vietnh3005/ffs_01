class Combo < ApplicationRecord
  has_many :products, through: :combo_products
  has_many :combo_products, dependent: :destroy
end
