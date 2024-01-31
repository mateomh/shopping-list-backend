module Resolvers
  class AllProductsResolver < GraphQL::Schema::Resolver
    description "Returns all the available products"
    type [Types::ProductType], null: false

    def resolve
      Products::GetAllProducts.run!['products']
    end
  end
end