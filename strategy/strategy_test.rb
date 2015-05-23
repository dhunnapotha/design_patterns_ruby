require 'test/unit'

require_relative 'generators/base'
require_relative 'generators/html'
require_relative 'generators/markdown'


class NewsletterTest < Test::Unit::TestCase
  def test_strategy_pattern
    assert_equal "This is Html execute. This is title in Newsletter Base", Newsletter::Base.new(:html).render
    assert_equal "This is Markdown execute", Newsletter::Base.new(:markdown).render
  end
end
