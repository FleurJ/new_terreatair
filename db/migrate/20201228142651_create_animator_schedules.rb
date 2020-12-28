class CreateAnimatorSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :animator_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
