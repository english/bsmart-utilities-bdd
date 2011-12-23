module Bsmart
  class TabbedPutter
    attr_accessor :tab_counter

    def initialize(output, tab_size = 2)
      @output = output
      @tab_size = tab_size
      @tab_counter = 0
    end

    def puts(message)
      @output.puts("#{' ' * @tab_size * @tab_counter}#{message}")
    end

    def tab!
      @tab_counter += 1
    end

    def un_tab!
      @tab_counter -= 1
    end
  end
end
