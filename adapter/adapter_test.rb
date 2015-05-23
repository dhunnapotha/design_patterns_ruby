require 'test/unit'
require 'json'
require_relative 'newsletter'
require_relative 'adapters/dummy'
require_relative 'adapters/json'

class AdapterPatternTest < Test::Unit::TestCase
  def test_adapter_pattern
    h = {:title => "Json Title", :body => "Json Body"}
    content =  Newsletter::Content.parse(h.to_json, :json)
    assert_equal "Json Body", content.body
    assert_equal "Json Title", content.title

    content =  Newsletter::Content.parse "dummy content", :dummy
    assert_equal "DummyBody", content.body
    assert_equal "DummyContent", content.title
  end
end