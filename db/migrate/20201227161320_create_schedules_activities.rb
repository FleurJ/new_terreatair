class CreateSchedulesActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules_activities do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
