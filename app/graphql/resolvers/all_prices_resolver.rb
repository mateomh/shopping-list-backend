module Resolvers
  class AllPricesResolver < GraphQL::Schema::Resolver
    description "Returns all the available prices"
    type [Types::PriceType], null: false

    def resolve
      Prices::GetAllPrices.run!["prices"]
    end
  end
end