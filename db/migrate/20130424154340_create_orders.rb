class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :address
      t.string :postcode
      t.string :stripe_customer_token
      t.string :stripe_card_token

      t.timestamps
    end
  end
end
