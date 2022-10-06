require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Fabricate(:category) }
  # let(:product) { Fabricate(:product, category: category)}
  
  context 'Category Model' do
    describe 'Relationships' do
      it 'should have one product associated' do
        Fabricate(:product, category: category)
        # binding.pry
        expect(category.products.count).to eql(1)
      end
    end
  end
end
