module Resolvers
  class SingleStoreResolver < GraphQL::Schema::Resolver
    description "Looks for a single store with the provided ID"
    type Types::StoreType, null: false
    argument :id, type: ID, required: true

    def resolve(id:)
      Store.find(id)
    end
  end
end