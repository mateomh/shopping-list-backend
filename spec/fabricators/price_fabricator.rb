require 'faker'

Fabricator(:price) do
  product
  store
  price {Faker::Commerce.price}
end