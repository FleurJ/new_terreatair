class UpdateDateAttributeToSchedule < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedules, :date, :schedule_date
  end
end
