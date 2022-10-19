class Stores::UpdateStore < ActiveInteraction::Base
  integer :store_id,
          desc: 'ID of the store',
          default: nil

  hash :store_information do
    string :name, default: nil
    string :location, default: nil
    string :logo_url, default: nil
  end

  validates :store_id, presence: true

  def execute
    begin
      record = Store.find(store_id)
      record.update!(store_information.compact)
      
      return record
    rescue => e
      errors.add(:base, e.to_s)
    end
  end
end