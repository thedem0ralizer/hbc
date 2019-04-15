class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price_in_dollars * quantity
  end
end
