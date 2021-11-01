class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :company

      t.timestamps
    end
  end
end
