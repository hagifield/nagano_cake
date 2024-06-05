class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :order_status, null: false
      t.integer :shipping_fee, null: false
      t.integer :charge, null: false
      t.integer :payment_method, null: false
      t.string :name, null: false
      t.strig :postal_code, null: false
      t.string :adress, null: false
      
    end
  end
end
