class DropActivitytypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :activity_taxonomies
    drop_table :activitytypes
  end
end
