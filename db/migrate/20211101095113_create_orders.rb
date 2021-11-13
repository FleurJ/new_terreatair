class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :discount_code
      t.integer :total_cost
      t.integer :number
      t.integer :adjustment_total
      t.integer :total
      t.integer :payment_total
      t.integer :shipment_total
      t.integer :included_tax_total
      t.integer :promo_total
      t.string :status
      t.date :completed_at
      t.string :shipment_status
      t.string :payment_status
      t.integer :item_count

      t.timestamps
    end
  end
end
