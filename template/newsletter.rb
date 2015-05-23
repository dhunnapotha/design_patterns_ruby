module Newsletter
  class Generator

    def header
      raise NoMethodError
    end

    def content
      raise NoMethodError
    end


    def render
<<-EOF
    #{header}

    #{content}
EOF
    end
    
  end
end