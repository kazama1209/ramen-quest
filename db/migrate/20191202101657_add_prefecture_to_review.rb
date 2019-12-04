class AddPrefectureToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :prefecture, :integer, default: 0, after: :shop_name
    add_column :reviews, :address, :string, after: :prefecture
  end
end
