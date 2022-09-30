class Store < ApplicationRecord
  # Model description
  
  # this is not an alternate way to make the products association but it might work for other associations
  # has_many :products, {
  #   class_name: 'Price',
  #   foreign_key: :store_id
  # }

  has_many :prices
  has_many :products, through: :prices
end
