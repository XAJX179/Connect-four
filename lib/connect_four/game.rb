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
      player1 = Player.new("\u25CF")
      player2 = Player.new("\u25CB")
      board = Board.new
      intro_messages(player1, player2)
      game_loop(player1, player2, board)
      # result(player1, player2)
    end

    def intro_messages(player1, player2)
      puts "\t\tConnect-4"
      puts "\t\tWelcome!"
      input_names(player1, player2)
      puts "\t\t#{player1.name} vs #{player2.name}"
    end

    def input_names(player1, player2)
      puts "Enter player1's name :"
      player1.input_name
      puts "Enter player2's name :"
      player2.input_name
    end

    def game_loop(player1, player2, board)
      puts 'Game starts!'
      loop do
        run_loop(player1, board)
        break if won?

        run_loop(player2, board)
        break if won?
      end
    end

    def run_loop(player, board)
      board.display_board
      move = player.input_move(board)
      board.insert_at(move, player.sign)
    end

    def won?
      @winner != ''
    end
  end
end
