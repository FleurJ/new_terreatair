class AddTimeToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :time, :string
  end
end
