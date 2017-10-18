module ImagrCookbook
  module Helpers
    def unfold_assistant(content, property, char)
      message = " #{content}: #{property} "
      length = handle_message(message)
      puts "\n"
      puts char * width
      puts "#{char * left_width(length)}#{message}#{char * right_width(length)}"
      puts char * width
      puts "\n" unless char == '-'
    end

    private

    def handle_message(message)
      if message.length > width
        width
      else
        message.length
      end
    end

    def width
      150
    end

    def left_width(length)
      difference = width - length
      difference / 2
    end

    def right_width(length)
      difference = left_width(length)
      if length.odd?
        difference + 1
      else
        difference
      end
    end
  end
end

Chef::Resource.include(ImagrCookbook::Helpers)
