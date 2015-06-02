class User
  attr_accessor :name

  def initialize name
    @name = name
  end
end


class Manager
  attr_accessor :name

  def initialize name
    @name = name
  end

end

class PaymentServiceFactory
  def for(obj)
    if obj.is_a? User
      UserPaymentService.new
    elsif obj.is_a? Manager
      ManagerPaymentService.new
    end
  end
end



class UserPaymentService
  def pay user, amount
    raise "Cannot perform payments"
  end
end

class ManagerPaymentService
  def pay user, amount
    "#{user.name} is paid #{amount}/-"
  end
end


require 'test/unit'
class PaymentServiceFactoryTest < Test::Unit::TestCase
  def test_payment_service_factory
    user = User.new('Chandra')
    manager = Manager.new('Gautam')

    service = PaymentServiceFactory.new.for user
    assert_raise RuntimeError, "Cannot perform payemnts" do
      service.pay manager, 100
    end

    service = PaymentServiceFactory.new.for manager
    assert_equal "Chandra is paid 100/-", service.pay(user, 100 )
  end
end