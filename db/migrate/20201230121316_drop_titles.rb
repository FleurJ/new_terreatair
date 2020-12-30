class DropTitles < ActiveRecord::Migration[6.0]
  def change
    drop_table :titles
  end
end
