jQuery -> 
    # Set stripe JS to work with our server
	Stripe.setPublishableKey($('meta[name="stripe-public-key"]').attr("value"))
	$("form#new_order").on "submit", ->
		Stripe.createToken
			number: $('#card_number').val()
			cvc: $('#cvc_number').val()
			expMonth: $('#card_month').val()
			expYear: $('#card_year').val()
		, (status, response) ->
			console.log status, response
			if status == 200
				$('#order_stripe_card_token').val(response.id)
				$('form#new_order')[0].submit()
			else
				$('form#new_order').prepend("<p>#{response.error.message}</p>")
		
		false