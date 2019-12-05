class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
