require 'forwardable'

class Product
  attr_reader :name, :type
  def initialize name, type
    @name = name
    @type = type
  end
end

class ProductDecorator
  attr_reader :context

  extend Forwardable

  def_delegators :context, :name, :type
  def initialize context
    @context = context
  end

  def present
      <<-EOF
        <name>#{name}</name>
        <type>#{type}</type>
      EOF
  end
end