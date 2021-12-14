class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|

      t.timestamps
      t.integer :customer_id
      t.string :name
      t.string :adress
      t.string :postal_code
    end
  end
end
