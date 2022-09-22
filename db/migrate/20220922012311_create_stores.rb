class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :location
      t.string :logo_url

      t.timestamps
    end
  end
end
