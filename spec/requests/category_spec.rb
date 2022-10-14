require 'rails_helper'
require 'json'

RSpec.describe "Categories", type: :request do
  context 'CRUD Operations' do
    describe "GET /categories" do
      it 'Should return a JSON object with all the categories' do
        get '/categories'

        expect(response).not_to be_nil
        expect(response).to have_http_status(:ok)
      end

      it 'Should return a JSON object with one of the categories' do
        record = Fabricate(:category)
        get "/categories/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(200)
        expect(response.body).to include(record.name)
      end
    end

    describe 'POST /categories' do
      it 'Should create a new category' do
        category_hash = ActiveSupport::HashWithIndifferentAccess.new({
          category: {
            name: "test category",
            description: "This is a test category"
          }
        })

        expect(Category.all.count).to eql(0)

        post "/categories", params: category_hash
        
        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('created')
        expect(Category.all.count).to eql(1)
        # expect{Category}.to change{Category.all.count}.by(1)
      end

      it 'Should return error code when failing' do
        post "/categories"
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(Category.all.count).to eql(0)
      end
    end
  end
end
