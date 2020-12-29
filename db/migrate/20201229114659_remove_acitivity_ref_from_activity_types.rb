class RemoveAcitivityRefFromActivityTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_types, :activity_id
  end
end
