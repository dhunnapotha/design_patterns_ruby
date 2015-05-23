require 'debugger'
module Newsletter
  class Base

    def initialize(format)
      @strategy = Newsletter::const_get(format.to_s.capitalize).new(self)
    end

    def render
      @strategy.execute
    end

    def title
      "This is title in Newsletter Base"
    end
  end
end