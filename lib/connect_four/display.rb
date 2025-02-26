# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # console display
  module Display
    def display_board
      string = +''
      5.downto(0) do |index|
        @data.each do |elem|
          node = elem[1].at(index)
          data = node.data unless node.nil?
          string << " #{data || ' '} │"
        end
        string << "\n"
      end
      puts "\n\n#{string}"
      puts ' 1   2   3   4   5   6   7'
    end
  end
end
