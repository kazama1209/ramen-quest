class CreateOpinons < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.text :content

      t.timestamps
    end
  end
end
