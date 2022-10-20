class Products::GetProductInfo < ActiveInteraction::Base
  integer :product_id,
         desc: 'ID of the product',
         default: nil

  validates :product_id, presence: true

  def execute
    begin
      record = Product.find(product_id)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        product: record
      })

      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end