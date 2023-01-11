class CalculateResults::GenerateStoreListService < ActiveInteraction::Base
  array :product_ids,
         desc: 'Array of IDs for the products',
         default: []

  validates :product_ids, presence: true

  def execute
    begin
      # record = Category.find(category_id)
      # response = ActiveSupport::HashWithIndifferentAccess.new({
      #   category: record
      # })

      puts "###############"
      puts product_ids
      puts "###############"
      # return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end