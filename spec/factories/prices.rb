# == Schema Information
#
# Table name: prices
#
#  id         :bigint           not null, primary key
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  store_id   :bigint
#
# Indexes
#
#  index_prices_on_product_id  (product_id)
#  index_prices_on_store_id    (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (store_id => stores.id)
#
FactoryBot.define do
  factory :price do
    
  end
end
