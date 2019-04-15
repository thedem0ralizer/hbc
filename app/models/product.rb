class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 50 }

  def price_in_dollars
    price.to_f / 100
  end
end
