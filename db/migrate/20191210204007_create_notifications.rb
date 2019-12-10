class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :inquiry, foreign_key: true
      t.string :action, default: '', null: false

      t.timestamps
    end
  end
end
