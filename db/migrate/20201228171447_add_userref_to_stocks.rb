class AddUserrefToStocks < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks, :user, null: false, foreign_key: true
  end
end
