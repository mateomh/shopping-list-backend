# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'faker'

Fabricator(:category) do
  name {Faker::Commerce.department(max: 1, fixed_amount: true)}
  description {Faker::Movie.quote}
end
