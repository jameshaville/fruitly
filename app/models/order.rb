class Order < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :postcode, :stripe_card_token, :stripe_customer_token

  has_many :order_products

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create({
          amount: total_price,
          currency: "gbp",
          card: stripe_card_token,
          description: email
        })
      save
    end
    rescue
      false
  end

  def total_price
  	
  	#start off at zero
  	price = 0
  	
  	#for each product in order
  	order_products.each do |order_product|
  		#add the products price to total
  		price += order_product.price_in_pence
  	end
  	
  	#return the total
  	price
  end

end
