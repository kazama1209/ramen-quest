class AddColumnImage3ToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :image3, :string, after: :image2
  end
end
