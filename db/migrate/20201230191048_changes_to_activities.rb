class ChangesToActivities < ActiveRecord::Migration[6.0]
  def change
    rename_column :activities, :public, :min_age
  end
end
