class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category, default: 0
      t.text :description
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
