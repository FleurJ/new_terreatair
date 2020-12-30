class AddUserRefToActivitytypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :activitytypes, :user, null: false, foreign_key: true
  end
end
