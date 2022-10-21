class Prices::CreatePrice < ActiveInteraction::Base
  float :price,
         desc: 'Price for the product',
         default: nil
  
  integer :store_id,
          desc: 'The store that has the product price',
          default: nil
  
  integer :product_id,
          desc: 'The product for the price',
          default: nil

  def execute
    ActiveRecord::Base.transaction do
      begin
        Price.create!({
          price: price,
          store_id: store_id,
          product_id: product_id
        })
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end