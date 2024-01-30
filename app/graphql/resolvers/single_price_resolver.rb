module Resolvers
  class SinglePriceResolver < GraphQL::Schema::Resolver
    description "Looks for a single price with the provided ID"
    type Types::PriceType, null: false
    argument :id, type: ID, required: true

    def resolve(id:)
      Price.find(id)
    end
  end
end