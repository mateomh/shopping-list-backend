module Resolvers
  class CategoriesResolver < GraphQL::Schema::Resolver
    description "Returns all avaliable categories"
    type [Types::CategoryType], null: false

    def resolve
      Categories::GetAllCategories.run!
    end
  end
end