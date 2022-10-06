require 'faker'

Fabricator(:store) do
  name {Faker::Commerce.vendor}
  location {Faker::Address.full_address}
  logo_url {Faker::Avatar.image}
end