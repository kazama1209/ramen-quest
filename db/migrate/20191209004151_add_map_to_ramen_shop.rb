class AddMapToRamenShop < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen_shops, :latitude, :float, after: :address
    add_column :ramen_shops, :longitude, :float, after: :latitude
  end
end
