class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps

      t.string :delivery_adress_number
      t.string :delivery_adress
      t.string :delivery_name
      t.integer:postage
      t.integer:totalprise
      t.integer:payment_method
      t.integer:order_status
      t.integer:customer_id
      t.integer:item_id
    end
  end
end
