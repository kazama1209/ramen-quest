class AddTasteToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :taste, :integer, default: 0, after: :address
  end
end
