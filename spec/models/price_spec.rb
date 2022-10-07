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
