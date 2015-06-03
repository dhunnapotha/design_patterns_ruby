require 'singleton'
class UserController
  attr_accessor :setting
  include Singleton

  def set_setting params
    @setting = params
  end  
end


require 'test/unit'
class SingletonPatternTest < Test::Unit::TestCase
  def test_singleton_pattern
    assert_raise NoMethodError do
      UserController.new
    end

    UserController.instance.set_setting "New Setting"
    assert_equal "New Setting", UserController.instance.setting

  end
end