class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, after: :salt
    add_column :users, :profile, :string, after: :name
    add_column :users, :image, :string, after: :profile
  end
end
