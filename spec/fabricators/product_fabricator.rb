# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  image_url   :string
#  name        :string           not null
#  quantity    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'faker'

Fabricator(:product) do
  category
  name {Faker::Commerce.product_name}
  quantity {Faker::Number.between(from: 1, to: 100)}
  description {Faker::Lorem.sentence}
  image_url {Faker::Avatar.image}
end
