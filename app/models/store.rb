class Store < ApplicationRecord
  # Model description
  has_many :products, through: :prices
  has_many :prices
end
