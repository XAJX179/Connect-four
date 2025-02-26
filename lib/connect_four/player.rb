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
      value = gets.chomp until valid_move?(value, board)
      value.to_i
    end

    private

    def valid_move?(value, board)
      value = value.to_i
      value.between?(0, 7) && board.space_left?(value)
    end
  end
end
