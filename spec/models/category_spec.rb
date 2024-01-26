# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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
