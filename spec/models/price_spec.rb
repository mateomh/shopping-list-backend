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
require 'rails_helper'

RSpec.describe Price, type: :model do
  let(:price) { Fabricate(:price) }

  context 'Price Model' do
    describe 'Associations' do
      it 'should have one product associated' do
        expect(price.product).not_to be_nil
      end

      it 'should have one store associated' do
        expect(price.store).not_to be_nil
      end
    end
  end
end
