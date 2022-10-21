class Prices::DeletePrice < ActiveInteraction::Base
  integer :price_id,
         desc: 'ID of the price',
         default: nil

  validates :price_id, presence: true

  def execute
    ActiveRecord::Base.transaction do
      begin
        record = Price.find(price_id)
        record.delete
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end