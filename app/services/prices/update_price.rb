class Prices::UpdatePrice < ActiveInteraction::Base
  integer :price_id,
          desc: 'ID of the price',
          default: nil

  hash :price_information do
    float :price, default: nil
    integer :store_id, default: nil
    integer :product_id, default: nil
  end

  def execute
    begin
      record = Price.find(price_id)
      record.update!(price_information.compact)
      
      return record
    rescue => e
      errors.add(:base, e.to_s)
    end
  end
end