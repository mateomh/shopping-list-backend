class Product < ApplicationRecord
# Model description

# id: integer                => Unique identifier for the product
# name: string, Not null     => Name of the product
# description: string        => Text describing the product
# quantity: string, Not null => Quantity that the product comes in
# image_url: string          => Url containing the image of the product
# category_id: integer       => Id for the category that the product belongs to (Foreign key)
# created_at: DateTime       => Date and time of creation
# updated_at: DateTime       => Date and time of last updated

  has_many :prices
  has_many :stores, through: :prices
  belongs_to :category
end
