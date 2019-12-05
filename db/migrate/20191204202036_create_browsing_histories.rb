class CreateBrowsingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :browsing_histories do |t|
      t.references :user, foreign_key: true
      t.references :ramen_shop, foreign_key: true

      t.timestamps
    end
  end
end
