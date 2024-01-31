# frozen_string_literal: true

module Types
  class StoreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :location, String
    field :logo_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :prices, [Types::PriceType], null: false

    def prices
      dataloader.with(Sources::ActiveRecordObject, Price, :store_id).load(object.id)
    end
  end
end
