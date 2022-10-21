class Categories::GetAllCategories < ActiveInteraction::Base
  def execute
    ActiveRecord::Base.transaction do
      begin
        records = Category.all
        response = HashWithIndifferentAccess.new({
          categories: records
        })

        return response
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end