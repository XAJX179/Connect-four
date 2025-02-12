# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # Game
  class Game
    def initialize
      @winner = ''
    end

    def start
      player1 = Player.new
      player2 = Player.new
      board = Board.new
      intro_messages(player1, player2, board)
      game_loop(player1, player2, board)
      # result(player1, player2)
    end

    def intro_messages(player1, player2, board)
      puts "\t\tConnect-4"
      puts "\t\tWelcome!"
      puts "\t\t#{player1} vs #{player2}"
      puts board.display_board
    end

    def game_loop(player1, player2, board)
    end
  end
end
