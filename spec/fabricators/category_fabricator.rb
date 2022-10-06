require 'faker'

Fabricator(:category) do
  name {Faker::Commerce.department(max: 1, fixed_amount: true)}
  description {Faker::Movie.quote}
end