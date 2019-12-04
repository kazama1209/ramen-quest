class AddColumnToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :shop_name, :string, after: :title
  end
end
