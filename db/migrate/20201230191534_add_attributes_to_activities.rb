class AddAttributesToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :max_age, :string
    add_column :activities, :debate, :boolean
    add_column :activities, :min_classes, :integer
    add_column :activities, :max_classes, :integer
  end
end
