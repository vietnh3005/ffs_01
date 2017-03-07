class Staff < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
  belongs_to :shop, required: false
end
