module Newsletter
  class HTML < Generator
    def header
      "<h1>This is a header</h1>"
    end

    def content
      "<p>This is the content </p>"
    end
  end
end