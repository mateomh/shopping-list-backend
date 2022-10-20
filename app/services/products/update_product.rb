class Products::UpdateProduct < ActiveInteraction::Base
  integer :product_id,
          desc: 'ID of the product',
          default: nil

  hash :product_information do
    string :name, default: nil
    string :quantity, default: nil
    string :image_url, default: nil
    string :description, default: nil
    integer :category_id, default: nil
  end

  validates :product_id, presence: true

  def execute
    begin
      record = Product.find(product_id)
      record.update!(product_information.compact)
      
      return record
    rescue => e
      errors.add(:base, e.to_s)
    end
  end
end