# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # Game
  class Game
    attr_reader :winner

    def initialize
      @winner = nil
      @total_moves = 0
    end

    def start
      player1 = Player.new("\u25CF")
      player2 = Player.new("\u25CB")
      board = Board.new
      intro_messages(player1, player2)
      game_loop(player1, player2, board)
    end

    def input_names(player1, player2)
      puts "Enter player1's name :"
      player1.input_name
      puts "Enter player2's name :"
      player2.input_name
    end

    def game_loop(player1, player2, board)
      puts 'Game starts!'
      board.display_board
      loop do
        run_loop(player1, board)
        break if won?

        run_loop(player2, board)
        break if won?
      end
    end

    # @return [Void]
    # @param player [ConnectFour::Player]
    # @param board [ConnectFour::Board]
    def run_loop(player, board)
      print "#{player.name}'s turn :"
      move = player.input_move(board)
      @total_moves += 1
      board.insert_at(move, player.sign)
      remove_invalid_warning_output
      board.redraw
      announce_winner(player) if check_win(board)
      tie if @total_moves == 42
    end

    # @return [Boolean]
    # checks if {#winner} is not nil.
    def won?
      @winner != nil
    end

    def check_win(board)
      board.four_connected?
    end

    private

    def intro_messages(player1, player2)
      puts "\t\tConnect-4"
      puts "\t\tWelcome!"
      input_names(player1, player2)
      puts "\t\t#{player1.name} vs #{player2.name}"
    end

    def remove_invalid_warning_output
      print "\e[1A                                                             \e[1E"
    end

    def announce_winner(player)
      @winner = player.name.to_s
      puts "#{@winner} won!"
    end

    def tie
      @winner = 'tie'
      puts 'Game ties.'
    end
  end
end
