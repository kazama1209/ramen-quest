class CreateRamenShops < ActiveRecord::Migration[5.2]
  def change
    create_table :ramen_shops do |t|
      t.string :name
      t.integer :prefecture, default: 0
      t.string :address
      t.string :phone
      t.string :image

      t.timestamps
    end
  end
end
