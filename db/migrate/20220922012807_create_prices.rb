class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :price, null: false
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
