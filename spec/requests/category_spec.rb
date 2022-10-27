require 'rails_helper'
require 'json'
require 'swagger_helper'

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

        expect{
          post "/categories", params: category_hash
        }.to change{Category.all.count}.by(1)
        
        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('created')
      end

      it 'Should return error code when failing' do
        expect {
          post "/categories"
        }.not_to change{Category.all.count}
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
      end
    end

    describe "PUT /categories" do
      it 'Should update the category' do
        record = Fabricate(:category)

        put "/categories/#{record.id}", params: {
          category: {
            description: "This is the updated description"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('updated')
        expect(Category.find(record.id).description).to eql('This is the updated description')
      end

      it 'Should return error when the record does not exists' do
        put "/categories/5", params: {
          category: {
            description: "This is the updated description"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end

      it 'Should return error when parameters not provided' do
        record = Fabricate(:category)

        expect{
          put "/categories/#{record.id}"
        }.to raise_error
      end
    end

    describe "DELETE /categories" do
      it 'Should delete the category' do
        record = Fabricate(:category)

        expect(Category.find(record.id)).to be

        delete "/categories/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('deleted')
      end

      it 'Should return error when the record does not exists' do
        delete "/categories/5"

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end
  end
end
