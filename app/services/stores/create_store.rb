class Stores::CreateStore < ActiveInteraction::Base
  string :name,
         desc: 'Name of the store',
         default: nil

  string :location,
         desc: 'Address for the store or any type of location information',
         default: nil

  string :logo_url,
         desc: 'An Url pointing to where the image is hosted',
         default: nil

  def execute
    ActiveRecord::Base.transaction do
      begin
        Store.create!({
          name: name,
          location: location,
          logo_url: logo_url
        })
      rescue Exception => e
        errors.add(:base, e.to_s)
      end
    end
  end
end