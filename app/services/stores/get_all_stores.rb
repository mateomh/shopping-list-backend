class Stores::GetAllStores < ActiveInteraction::Base
  def execute
    ActiveRecord::Base.transaction do
      begin
        records = Store.all
        response = HashWithIndifferentAccess.new({
          stores: records
        })

        return response
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end