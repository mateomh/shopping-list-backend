class Products::DeleteProduct < ActiveInteraction::Base
  integer :product_id,
         desc: 'ID of the product',
         default: nil

  validates :product_id, presence: true

  def execute
    ActiveRecord::Base.transaction do
      begin
        record = Product.find(product_id)
        record.delete
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end