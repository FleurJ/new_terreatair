class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :type
      t.string :public
      t.float :price
      t.string :duration
      t.string :links
      t.string :language
      t.string :status

      t.timestamps
    end
  end
end
