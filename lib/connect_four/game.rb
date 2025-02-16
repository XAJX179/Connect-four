# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # Game
  class Game
    attr_reader :winner

    def initialize
      @winner = ''
    end

    def start
      player1 = Player.new('A')
      player2 = Player.new('B')
      board = Board.new
      intro_messages(player1, player2, board)
      # game_loop(player1, player2, board)
      # result(player1, player2)
    end

    def intro_messages(player1, player2, board)
      puts "\t\tConnect-4"
      puts "\t\tWelcome!"
      input_names(player1, player2)
      puts "\t\t#{player1.name} vs #{player2.name}"
      board.display_board
    end

    def input_names(player1, player2)
      puts "Enter player1's name :"
      player1.input_name
      puts "Enter player2's name :"
      player2.input_name
    end

    def game_loop(player1, player2, board)
      run_loop(player1, player2, board) until won?
    end

    def run_loop(player1, player2, board)
      puts player1, player2, board
      puts "here#{@winner}"
    end

    def won?
      @winner != ''
    end
  end
end
