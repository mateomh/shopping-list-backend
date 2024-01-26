# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  location   :string
#  logo_url   :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
