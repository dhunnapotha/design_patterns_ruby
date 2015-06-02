class User
  attr_accessor :name
  def initialize name
    @name = name
    @observers = []
  end


  def subscribe observer
    @observers << observer
  end


  def update_name name
    @name = name
    @observers.each{|o| o.updated self}
  end
end


class UserObserver
  def updated user
    user.name
  end
end


require 'test/unit'
require 'mocha/test_unit'
class ObserverPatternTest < Test::Unit::TestCase
  def test_observer_pattern
    user = User.new('Gautam')
    observer = UserObserver.new
    user.subscribe observer

    observer.expects(:updated).with(user)
    user.update_name "Gautam Chandra"
  end
end