module Newsletter
  module Adapter
    class Dummy
      def self.parse(content)
        {"body" => "DummyBody", "title" => "DummyContent"}
      end
    end
  end
end
