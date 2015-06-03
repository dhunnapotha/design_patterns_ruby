class CarProductionLine
  attr_accessor :state
  def initialize
    @state = EngineInstallationState.new self 
  end

  def move_to! state
    # Just call state.next
    @state.next state
  end
end


class EngineInstallationState
  def initialize context
    @context = context
  end

  def next state
    raise "IllegalStateJump" unless state == :hood
    @context.state = HoodInstallationState.new @context
  end
end


class HoodInstallationState
  def initialize context
    @context = context
  end
end



require 'test/unit'
class StatePatternTest < Test::Unit::TestCase
  def test_state_pattern
      car = CarProductionLine.new
      assert_equal EngineInstallationState, car.state.class

      assert_raise RuntimeError do 
        car.move_to! :wheels
      end
   
      car.move_to! :hood
      assert_equal HoodInstallationState, car.state.class
  end
end