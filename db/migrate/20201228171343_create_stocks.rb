class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :production_date
      t.string :operation
      t.string :producer
      t.text :comment
      t.string :country

      t.timestamps
    end
  end
end
