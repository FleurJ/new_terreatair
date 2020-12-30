class CreateActivitytypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activitytypes do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
