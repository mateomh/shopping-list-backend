module Resolvers
  class SingleProductResolver < GraphQL::Schema::Resolver
    description "Looks for a single product with the provided ID"
    type Types::ProductType, null: false
    argument :id, type: ID, required: true

    def resolve(id:)
      Product.find(id)
    end
  end
end