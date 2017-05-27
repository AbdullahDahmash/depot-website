require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "add unique products" do
    cart = Cart.new
    line_item1 = cart.add_product(products(:one))
    line_item2 = cart.add_product(products(:two))

    assert_equal line_item1.quantity, 1
    assert_equal line_item2.quantity, 1

  end

  test "add duplicate products" do
    cart = Cart.new
    product = Product.first
    line_item = cart.add_product(product)
    line_item.save
    line_item = cart.add_product(product)
    line_item.save

    assert_equal line_item.quantity, 2

  end

end
