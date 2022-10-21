class Categories::UpdateCategory < ActiveInteraction::Base
  integer :category_id,
          desc: 'ID of the category',
          default: nil

  hash :category_information do
    string :name, default: nil
    string :description, default: nil
  end

  def execute
    begin
      record = Category.find(category_id)
      record.update!(category_information.compact)
      
      return record
    rescue => e
      errors.add(:base, e.to_s)
    end
  end
end