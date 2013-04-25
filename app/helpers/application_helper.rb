module ApplicationHelper
	def quid(num)
		number_to_currency num / 100.0, unit: "&pound;"
	end
	def md(text)
		if text.present?
			RDiscount.new(text).to_html.html_safe
		else
			""
		end
	end
end
