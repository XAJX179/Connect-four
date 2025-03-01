# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # console display
  module Display
    def display_board
      string = board_string
      # draw board_string
      puts "\n\n#{string}"
      # index values
      puts " 1   2   3   4   5   6   7\n\n"
    end

    def board_string
      string = +''
      5.downto(0) do |index|
        @data.each do |elem|
          node = elem[1].at(index)
          data = node.data unless node.nil?
          string << " #{data || ' '} │"
        end
        string << "\n"
      end
      string
    end

    def redraw
      print "\e[11F"
      display_board
    end
  end
end
