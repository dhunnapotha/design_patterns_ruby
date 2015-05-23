module Newsletter
  class Content
    attr_accessor :title, :body
    def self.parse(input, format)
      adapter = Newsletter::Adapter.const_get(format.to_s.capitalize)
      output = adapter.parse(input)
      new output["title"], output["body"]
    end

    def initialize title, body
      @title = title
      @body = body
    end
  end
end