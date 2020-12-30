class AddActivitytypesrefToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :activitytype, foreign_key: true
  end
end
