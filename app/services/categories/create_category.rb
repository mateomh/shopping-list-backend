class Categories::CreateCategory < ActiveInteraction::Base
  string :name,
         desc: 'Name of the category',
         default: nil
  
  string :description,
         desc: 'A description of the category',
         default: nil

  def execute
    ActiveRecord::Base.transaction do
      begin
        Category.create!({
          name: name,
          description: description
        })
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end