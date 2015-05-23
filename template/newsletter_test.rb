require 'test/unit'
require_relative 'newsletter'
require_relative 'generators/html'
require_relative 'generators/markdown'

class NewsletterTest < Test::Unit::TestCase
  def test_template_pattern
    assert_equal "<h1>This is a header</h1>", Newsletter::HTML.new.header
    assert_equal "# this is markdown header", Newsletter::Markdown.new.header

    assert_raise NoMethodError do
      Newsletter::Generator.new.header
    end

    assert_match /This is a header/, Newsletter::HTML.new.render
    assert_match /this is markdown header/, Newsletter::Markdown.new.render
  end
end

