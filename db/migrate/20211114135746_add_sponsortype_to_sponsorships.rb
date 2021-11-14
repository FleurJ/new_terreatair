class AddSponsortypeToSponsorships < ActiveRecord::Migration[6.0]
  def change
    add_column :sponsorships, :sponsor_type, :string
  end
end
