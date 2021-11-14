class AddSponsorshiptypeToSponsorships < ActiveRecord::Migration[6.0]
  def change
    add_column :sponsorships, :sponsorship_type, :string
    add_reference :sponsorships, :user, null: false, foreign_key: true
  end
end
