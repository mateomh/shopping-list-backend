class Prices::GetPrice < ActiveInteraction::Base
  integer :price_id,
         desc: 'ID of the price',
         default: nil

  validates :price_id, presence: true

  def execute
    begin
      record = Price.find(price_id)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        price: record
      })

      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end