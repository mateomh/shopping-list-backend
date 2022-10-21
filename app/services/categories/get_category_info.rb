class Categories::GetCategoryInfo < ActiveInteraction::Base
  integer :category_id,
         desc: 'ID of the category',
         default: nil

  validates :category_id, presence: true

  def execute
    begin
      record = Category.find(category_id)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        category: record
      })

      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end