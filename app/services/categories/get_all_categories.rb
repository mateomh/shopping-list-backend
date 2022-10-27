class Categories::GetAllCategories < ActiveInteraction::Base
  def execute
    ActiveRecord::Base.transaction do
      begin
        records = Category.all

        return records
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end