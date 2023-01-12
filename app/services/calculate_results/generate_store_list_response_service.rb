class CalculateResults::GenerateStoreListResponseService < ActiveInteraction::Base
  hash :list_data,
        strip: false,
        desc: 'Hash with the store id as key and an array of product ids as value',
        default: {}

  validates :list_data, presence: true

  def execute
    begin
      response = {
        stores: [],
        result: list_data
      }
      store_ids = list_data.keys

      store_ids.each do |store_id|
        response[:stores].push(Store.find(store_id))
      end
      
      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end