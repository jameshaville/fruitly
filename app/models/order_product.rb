class OrderProduct < ActiveRecord::Base
  attr_accessible :order_id, :price_in_pence, :product_id, :quantity

  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :price_in_pence, presence: true, numericality:{
  	greater_than_or_equal_to: 0
  }

  delegate :title, :short_description, :description, :image, to: :product

end
