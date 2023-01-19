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
        store = Store.find(store_id)
        store_hash = ActiveSupport::HashWithIndifferentAccess.new(store.as_json)
        store_hash[:associated_products] = list_data[store_id]
        response[:stores].push(store_hash)
      end
      
      return response
    rescue Exception => e
      errors.add(:base, e.to_s)
    end
  end
end