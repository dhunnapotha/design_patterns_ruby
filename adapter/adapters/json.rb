require 'json'
module Newsletter
  module Adapter
    class Json
      def self.parse(content)
        JSON.parse(content)
      end
    end
  end
end