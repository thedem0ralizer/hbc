class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_line_item

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 50 }

  def price_in_dollars
    price.to_f / 100
  end

  private

  def ensure_not_referenced_by_line_item
    unless line_items.empty?
      errors.add(:base, "This item is in a cart")
      throw :abort
    end
  end

end
