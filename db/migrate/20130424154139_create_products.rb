class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :short_description
      t.text :description
      t.integer :price_in_pence, default: 0
      t.boolean :is_live, default: true
      t.integer :stock_remaining, default: 0

      t.timestamps
    end
  end
end
