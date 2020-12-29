class AddReferencesToActivityTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :activity_types, :user, null: false, foreign_key: true
    add_reference :activity_types, :activity, null: false, foreign_key: true
  end
end
