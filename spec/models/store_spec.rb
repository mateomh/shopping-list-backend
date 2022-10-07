require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'Store Model' do
    describe 'Associations' do
      before(:all) do
        @store = Fabricate(:store)
        @product1 = Fabricate(:product)
        @product2 = Fabricate(:product)
        @price1_1 = Fabricate(:price, store: @store, product: @product1)
        @price2_1 = Fabricate(:price, store: @store, product: @product1)
        @price1_2 = Fabricate(:price, store: @store, product: @product2)
        @price2_2 = Fabricate(:price, store: @store, product: @product2)
      end

      it 'should have four prices associated' do
        expect(@store.prices).not_to be_nil
        expect(@store.prices.count).to eql(4)
        expect(@store.prices).to include(@price1_1)
        expect(@store.prices).to include(@price1_2)
        expect(@store.prices).to include(@price2_1)
        expect(@store.prices).to include(@price2_2)
      end

      it 'should have two unique products associated' do
        expect(@store.products).not_to be_nil
        expect(@store.products.uniq.count).to eql(2)
        expect(@store.products).to include(@product1).twice
        expect(@store.products).to include(@product2).twice
      end
    end
  end
end
