require 'rails_helper'

RSpec.describe "Prices", type: :request do
  context 'CRUD Operations' do
    describe "GET /prices" do
      it 'Should return a JSON object with all the prices' do
        get '/prices/all'

        expect(response).not_to be_nil
        expect(response).to have_http_status(:ok)
      end

      it 'Should return a JSON object with one of the categories' do
        record = Fabricate(:price)
        get "/prices/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(200)
        expect(response.body).to include(record.price.to_s)
      end
    end

    describe 'POST /prices' do
      it 'Should create a new price' do
        store = Fabricate(:store)
        product = Fabricate(:product)

        price_hash = ActiveSupport::HashWithIndifferentAccess.new({
          price: {
            price: 300.0,
            product_id: product.id,
            store_id: store.id
          }
        })

        expect {
          post "/prices/create", params: price_hash
        }.to change {Price.all.count}.by(1)
        
        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('created')
      end

      it 'Should return error code when failing' do
        expect {
          post "/prices/create"
        }.not_to change {Price.all.count}
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
      end
    end

    describe "PUT /prices" do
      it 'Should update a price' do
        record = Fabricate(:price)

        put "/prices/#{record.id}", params: {
          price: {
            price: 200.0
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('updated')
        expect(Price.find(record.id).price).to eql(200.0)
      end

      it 'Should return error when the record does not exists' do
        put "/prices/500", params: {
          price: {
            name: "This is the updated name"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end

      it 'Should return error when parameters not provided' do
        record = Fabricate(:price)

        put "/prices/#{record.id}"
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end

    describe "DELETE /prices" do
      it 'Should delete the price' do
        record = Fabricate(:price)

        expect(Price.find(record.id)).to be

        delete "/prices/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('deleted')
      end

      it 'Should return error when the record does not exists' do
        delete "/prices/5"

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end
  end
end
