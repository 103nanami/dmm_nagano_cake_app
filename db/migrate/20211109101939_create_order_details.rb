class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      
    end
  end
end
