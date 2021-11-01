class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status
      t.integer :cost
      t.date :booking_date
      t.string :cancellation_reason
      t.boolean :refunded
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.string :validation

      t.timestamps
    end
  end
end
