class OrdersController < ApplicationController
  def new
  	@order = Order.new
  	@order = build_order(@order)
  end

  def create
    @order = Order.new(params[:order])
    @order = build_order(@order)
    if @order.save_with_payment

      OrderMailer.admin(@order).deliver
      OrderMailer.customer(@order).deliver

    	basket.clear
    	flash[:success] = "You have placed an order"
    	#stops order being submitted twice
    	redirect_to order_path(@order)
    else
    	render "new"
    end
  end

  def show
    @order = Order.find params[:id]
  end

  private

  def build_order(order)
  	#Loop through each basket item
  	basket.each do |product_id|
  		#find each product in basket
  		@product = Product.find product_id
  		#add it to the order
  		@order.order_products.new(product_id: @product.id, 
  								  price_in_pence: @product.price_in_pence)
  	end

  	order
  end
end
