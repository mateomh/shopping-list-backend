module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Resolver defined in the query type file
    field :category, Types::CategoryType, null: false do
      description "Returns a single category"
      argument :id, ID, required: true
    end

    def category(id:)
      Category.find(id)
    end

    # Resolvers called from files for code organization
    field :categories, resolver: Resolvers::CategoriesResolver

    # STORES resolvers
    field :single_store, resolver: Resolvers::SingleStoreResolver
    field :all_stores, resolver: Resolvers::AllStoresResolver

    # PRICES resolvers
    field :single_price, resolver: Resolvers::SinglePriceResolver
    field :all_prices, resolver: Resolvers::AllPricesResolver

    # PRODUCT resolvers
    field :single_product, resolver: Resolvers::SingleProductResolver
    field :all_products, resolver: Resolvers::AllProductsResolver
  end
end
