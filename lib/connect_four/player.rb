# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # Player
  class Player
    attr_reader :name, :sign

    def initialize(sign)
      @name = nil
      @sign = sign
    end

    def input_name
      @name = gets.chomp
    end

    def input_move(board)
      value = '10'
      until valid_move?(value, board)
        value = gets.chomp
        # moving cursor in directions i want to print output
        print "\e[1A\e[#{@name.length + 9}C         invalid_move try again.    \e[36D" unless valid_move?(value, board)
      end
      value.to_i
    end

    private

    def valid_move?(value, board)
      value = value.to_i
      value.between?(0, 7) && board.space_left?(value)
    end
  end
end
