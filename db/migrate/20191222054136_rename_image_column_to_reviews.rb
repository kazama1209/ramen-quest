class RenameImageColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :image, :image1
    add_column :reviews, :image2, :string, after: :image1
  end
end
