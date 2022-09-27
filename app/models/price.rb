class Price < ApplicationRecord
  # Model Description
  belongs_to :product
  belongs_to :store
end
