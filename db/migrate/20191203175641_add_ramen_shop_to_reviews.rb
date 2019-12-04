class AddRamenShopToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :ramen_shop, foreign_key: true, after: :user_id
  end
end
