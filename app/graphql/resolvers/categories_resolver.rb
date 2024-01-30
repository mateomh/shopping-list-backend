module Resolvers
  class CategoriesResolver < GraphQL::Schema::Resolver
    type [Types::CategoryType], null: false

    def resolve
      Categories::GetAllCategories.run!
    end
  end
end