require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Fabricate(:category) }
  let(:product) { Fabricate(:product, category: category) }
  let(:store1) { Fabricate(:store) }
  let(:store2) { Fabricate(:store) }
  let(:price1) { Fabricate(:price, product: product, store: store1) }
  let(:price2) { Fabricate(:price, product: product, store: store2) }

  context 'Product Model' do
    describe 'Associations' do
      before(:each) do
        category
        product
        store1
        store2
        price1
        price2
      end

      it 'should have one category associated' do
        expect(product.category).not_to be_nil
        expect(product.category).to eql(category)
      end

      it 'should have two stores associated' do
        expect(product.stores).not_to be_nil
        expect(product.stores.count).to eql(2)
        expect(product.stores).to include(store1)
        expect(product.stores).to include(store2)
      end

      it 'should have two prices associated' do
        expect(product.prices).not_to be_nil
        expect(product.prices.count).to eql(2)
        expect(product.prices).to include(price1)
        expect(product.prices).to include(price2)
      end
    end
  end
end
