require 'faker'

Fabricator(:product) do
  category
  name {Faker::Commerce.product_name}
  quantity {Faker::Number.between(from: 1, to: 100)}
  description {Faker::Lorem.sentence}
  image_url {Faker::Avatar.image}
end