require 'rails_helper'

RSpec.describe "Stores", type: :request do
  context 'CRUD Operations' do
    describe "GET /stores" do
      it 'Should return a JSON object with all the stores' do
        get '/stores/all'

        expect(response).not_to be_nil
        expect(response).to have_http_status(:ok)
      end

      it 'Should return a JSON object with one of the categories' do
        record = Fabricate(:store)
        get "/stores/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(200)
        expect(response.body).to include(record.name)
      end
    end

    describe 'POST /stores' do
      it 'Should create a new store' do
        store_hash = ActiveSupport::HashWithIndifferentAccess.new({
          store: {
            name: "test store",
            location: "This is a test store",
            logo_url: "asdshusidhufdfjd"
          }
        })

        expect {
          post "/stores/create", params: store_hash
        }.to change {Store.all.count}.by(1)
        
        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('created')
      end

      it 'Should return error code when failing' do
        expect {
          post "/stores/create"
        }.not_to change {Store.all.count}
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
      end
    end

    describe "PUT /stores" do
      it 'Should update a store' do
        record = Fabricate(:store)

        put "/stores/#{record.id}", params: {
          store: {
            name: "This is the updated name"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('updated')
        expect(Store.find(record.id).name).to eql('This is the updated name')
      end

      it 'Should return error when the record does not exists' do
        put "/stores/500", params: {
          store: {
            name: "This is the updated name"
          }
        }

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end

      it 'Should return error when parameters not provided' do
        record = Fabricate(:store)

        put "/stores/#{record.id}"
        
        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end

    describe "DELETE /stores" do
      it 'Should delete the store' do
        record = Fabricate(:store)

        expect(Store.find(record.id)).to be

        delete "/stores/#{record.id}"

        expect(response).not_to be_nil
        expect(response.status).to eql(201)
        expect(response.body).to include('deleted')
      end

      it 'Should return error when the record does not exists' do
        delete "/stores/5"

        expect(response).not_to be_nil
        expect(response.status).to eql(400)
        expect(response.body).to include('error')
      end
    end
  end
end
