class Categories::DeleteCategory < ActiveInteraction::Base
  integer :category_id,
         desc: 'ID of the category',
         default: nil

  validates :category_id, presence: true

  def execute
    ActiveRecord::Base.transaction do
      begin
        record = Category.find(category_id)
        record.delete
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end