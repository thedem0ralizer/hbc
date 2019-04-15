require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @product = Product.new
  end

  test 'product attributes are not blank' do
    @product.attributes.keys.each do |attribute|
      assert @product.errors[attribute], "#{attribute} can't be blank"
    end
  end

  test 'product price is greater than or equal to 50 cents' do
    @product.name = 'soap'
    @product.description = 'cleans you'
    bad_prices = [-1, 0, 1]
    bad_prices.each do |price|
      @product.price = price
      assert @product.invalid?
      assert_equal [I18n.t('errors.messages.greater_than_or_equal_to', count: 50)], @product.errors[:price]  
    end
  end

  test 'valid products have unique names' do
    @product.name = products(:one).name
    assert @product.invalid?
    assert_equal [I18n.t('errors.messages.taken')], @product.errors[:name]
  end

end
