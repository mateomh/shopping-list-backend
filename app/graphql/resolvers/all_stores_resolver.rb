module Resolvers
  class AllStoresResolver < GraphQL::Schema::Resolver
    description "Returns all the available stores"
    type [Types::StoreType], null: false

    def resolve
      Stores::GetAllStores.run!["stores"]
    end
  end
end