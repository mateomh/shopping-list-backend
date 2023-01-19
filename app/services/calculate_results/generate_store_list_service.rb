class CalculateResults::GenerateStoreListService < ActiveInteraction::Base
  array :product_ids,
         desc: 'Array of IDs for the products',
         default: []

  validates :product_ids, presence: true

  def execute
    begin
      data = {}
      product_ids.each do |product_id|
        product = Product.find(product_id)
        product_hash = product.as_json
        best_price = product.prices.order(price: :asc).first
        product_hash[:best_price] = best_price.price
        data[best_price.store_id] = [data[best_price.store_id]].flatten.push(product_hash).compact
      end
      
      response = CalculateResults::GenerateStoreListResponseService.run!(
        list_data: data
      )
      
      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end