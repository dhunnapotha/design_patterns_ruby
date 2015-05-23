require 'forwardable'

module Newsletter
  class Html
    extend Forwardable

    attr_accessor :context

    def_delegators :context, :title

    def initialize(context)
      @context = context
    end

    def execute
      "This is Html execute. #{title}"
    end
  end
end