class Stores::DeleteStore < ActiveInteraction::Base
  integer :store_id,
         desc: 'ID of the store',
         default: nil

  validates :store_id, presence: true

  def execute
    ActiveRecord::Base.transaction do
      begin
        record = Store.find(store_id)
        record.delete
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end