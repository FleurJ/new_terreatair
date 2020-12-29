class CreateActivityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_types do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
