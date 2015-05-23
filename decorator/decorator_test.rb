require 'test/unit'

require_relative 'product'

class DecoratorTest < Test::Unit::TestCase
  def test_decorator_pattern
    product = Product.new(:orange, :fruit)
    expected_output = <<-EOF
        <name>orange</name>
        <type>fruit</type>
      EOF
    assert_equal expected_output, ProductDecorator.new(product).present
  end
end