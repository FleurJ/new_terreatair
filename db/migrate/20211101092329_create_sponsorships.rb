class CreateSponsorships < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsorships do |t|
      t.integer :amount
      t.boolean :recurring
      t.string :frequency

      t.timestamps
    end
  end
end
