class Products::GetAllProducts < ActiveInteraction::Base
  def execute
    ActiveRecord::Base.transaction do
      begin
        records = Product.all
        response = HashWithIndifferentAccess.new({
          products: records
        })

        return response
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end