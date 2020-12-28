class AddAtributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :animator, :boolean
    add_column :users, :editor, :boolean
    add_column :users, :newsletters, :string
  end
end
