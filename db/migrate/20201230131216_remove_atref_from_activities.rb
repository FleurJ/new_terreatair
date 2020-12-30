class RemoveAtrefFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :activities, column: :activitytypes_id
  end
end
