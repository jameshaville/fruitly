class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, default: 1
      t.integer :price_in_pence,  default: 0

      t.timestamps
    end
  end
end
