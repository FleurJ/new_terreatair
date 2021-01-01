class ChangeClassesQtyToSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :schedules, :classes_qty
    add_column :schedules, :classes_qty, :string
  end
end
