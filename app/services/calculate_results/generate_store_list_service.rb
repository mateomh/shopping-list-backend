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
        best_price = product.prices.order(price: :asc).first
        data[best_price.store_id] = [data[best_price.store_id]].flatten.push(product_id).compact
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