class RenameCountryFromStocks < ActiveRecord::Migration[6.0]
  def change
    rename_column :stocks, :country, :origin
  end
end
