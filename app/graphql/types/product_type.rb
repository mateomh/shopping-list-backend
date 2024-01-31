# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :quantity, String, null: false
    field :description, String
    field :image_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :category_id, Integer
    # This field creates an n+1 problem
    field :category, Types::CategoryType, null: false

    def category
      # Using the data loader to get rid of the n+1
      dataloader.with(Sources::ActiveRecordObject, Category).load(object.category_id)
    end
  end
end
