# frozen_string_literal: true

module Types
  class PriceType < Types::BaseObject
    field :id, ID, null: false
    field :price, Float, null: false
    field :product_id, Integer
    field :store_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :store, Types::StoreType, null: false

    def store
      dataloader.with(Sources::ActiveRecordObject, Store).load(object.store_id)
    end
  end
end
