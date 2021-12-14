class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.timestamps

      t.string :name
      t.string:image_id
      t.text :introduction
      t.integer :price
      t.string :genre
    end
  end
end
