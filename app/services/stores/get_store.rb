class Stores::GetStore < ActiveInteraction::Base
  integer :store_id,
         desc: 'ID of the store',
         default: nil

  validates :store_id, presence: true

  def execute
    begin
      record = Store.find(store_id)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        store: record
      })

      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end