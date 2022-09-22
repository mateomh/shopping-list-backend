class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :quantity, null: false
      t.string :description
      t.string :image_url
      # t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
