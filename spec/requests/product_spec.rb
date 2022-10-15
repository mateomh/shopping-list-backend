require 'rails_helper'

RSpec.describe "Products", type: :request do
  context 'CRUD Operations' do
    describe "GET /products" do
      it 'Should return a JSON object with all the products' do
        get '/products/all'

        expect(response).not_to be_nil
        expect(response).to have_http_status(:ok)
      end

      it 'Should return a JSON object with one of the categories' do
        record = Fabricate(:product)
        get "/products/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(200)
        expect(response.body).to include(record.name)
      end
    end

    describe 'POST /products' do
      it 'Should create a new product' do
        category = Fabricate(:category)
        product_hash = ActiveSupport::HashWithIndifferentAccess.new({
          product: {
            name: "test category",
            description: "This is a test category",
            quantity: 1,
            image_url: "asdshusidhufdfjd",
            category_id: category.id
          }
        })

        expect {
          post "/products/create", params: product_hash
        }.to change {Product.all.count}.by(1)
        
        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('created')
      end

      it 'Should return error code when failing' do
        expect {
          post "/products/create"
        }.not_to change {Product.all.count}
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
      end
    end

    describe "PUT /products" do
      it 'Should update a product' do
        # category = Fabricate(:category)
        record = Fabricate(:product)

        put "/products/#{record.id}", params: {
          product: {
            description: "This is the updated description"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('updated')
        expect(Product.find(record.id).description).to eql('This is the updated description')
      end

      it 'Should return error when the record does not exists' do
        put "/products/500", params: {
          product: {
            description: "This is the updated description"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end

      it 'Should return error when parameters not provided' do
        record = Fabricate(:product)

        put "/products/#{record.id}"
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end

    describe "DELETE /products" do
      it 'Should delete the product' do
        record = Fabricate(:product)

        expect(Product.find(record.id)).to be

        delete "/products/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('deleted')
      end

      it 'Should return error when the record does not exists' do
        delete "/products/5"

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end
  end
end
