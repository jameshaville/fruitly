ActiveAdmin.register Product do
  form do |f|
  	f.inputs do
  		f.input :title
  		f.input :short_description
  		f.input :description
  		f.input :image
  		f.input :price_in_pence
  		f.input :is_live
  		f.input :stock_remaining
  	end
  	f.buttons
  end
end
