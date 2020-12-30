class CreateActivityActivitytypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_activitytypes do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :activitytype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
