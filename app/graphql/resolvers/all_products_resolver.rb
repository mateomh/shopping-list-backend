module Resolvers
  class AllProductsResolver < GraphQL::Schema::Resolver
    description "Returns all the available products"
    type [Types::ProductType], null: false

    def resolve
      result = Products::GetAllProducts.run!
      binding.pry
      result
    end
  end
end