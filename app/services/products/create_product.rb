class Products::CreateProduct < ActiveInteraction::Base
  string :name,
         desc: 'Name of the product',
         default: nil

  string :quantity,
         desc: 'Quantity of the product',
         default: nil

  string :image_url,
         desc: 'An Url pointing to where the image is hosted',
         default: nil
  
  string :description,
         desc: 'A description of the product',
         default: nil

  integer :category_id,
          desc: 'The id of the category the product belongs to'

  validates :category_id, presence: true

  def execute
    ActiveRecord::Base.transaction do
      begin
        Product.create!({
          name: name,
          description: description,
          image_url: image_url,
          quantity: quantity,
          category_id: category_id
        })
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end