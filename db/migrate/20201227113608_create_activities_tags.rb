class CreateActivitiesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :activities_tags do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
