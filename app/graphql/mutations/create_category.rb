module Mutations
  class CreateCategory < GraphQL::Schema::Mutation
    description 'Creates a new category'
    field :status, String, null: false
    field :errors, [String], null: true

    argument :name, type: String, required: true

    def resolve(name:)
      Category.create!(name: name)
      { status: 'created' }
    rescue StandardError => e
      { status: 'error' , errors: [**e.messages]}
    end
  end
end