class Prices::GetAllPrices < ActiveInteraction::Base
  def execute
    ActiveRecord::Base.transaction do
      begin
        records = Price.all
        response = HashWithIndifferentAccess.new({
          prices: records
        })

        return response
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end