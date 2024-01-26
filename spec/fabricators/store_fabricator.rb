# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  location   :string
#  logo_url   :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'faker'

Fabricator(:store) do
  name {Faker::Commerce.vendor}
  location {Faker::Address.full_address}
  logo_url {Faker::Avatar.image}
end
