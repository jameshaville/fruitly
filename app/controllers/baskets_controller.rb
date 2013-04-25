class BasketsController < ApplicationController
  
  def create
  	
  	#Find the product for adding to the basket
  	@product = Product.find params[:product_id]

  	#Add the product to the basket
  	basket.add(@product.id)
    
    #Success message
  	flash[:success] = "Added product to basket"

    if params[:back] == "product"
      redirect_to product_path(@product)
    else
  	  #Redirect to root page
  	  redirect_to root_path
    end
  end

  def destroy
  	
  	#Find the product to remove from the basket
  	@product = Product.find params[:product_id]
  	
  	#Delete the product from the basket
  	basket.delete(@product.id)
  	
  	#Success message
  	flash[:success] = "Removed product from basket"
  	
    #redirect back to product page
    if params[:back] == "orders"
      redirect_to new_order_path
    elsif params[:back] == 'product'
      redirect_to product_path(@product)
    else
    	#Redirect to product page
    	redirect_to root_path
    end
  end
end
