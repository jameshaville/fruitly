class Product < ActiveRecord::Base
  attr_accessible :description, :is_live, :price_in_pence, 
  :short_description, :stock_remaining, :title, :image

  has_attached_file :image, styles: {
  	large: "500x500#",
  	medium: "250x250#",
  	small: "100x100#"
  }

  has_many :order_products

  validates :title, presence: true
  validates :price_in_pence, presence: true, numericality: {
  	greater_than_or_equal_to: 0
  }
  validates :stock_remaining, presence: true, numericality: {
  	greater_than_or_equal_to: 0
  }

end
