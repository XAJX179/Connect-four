# frozen_string_literal: true

require_relative '../lib/connect_four/game'
require_relative '../lib/connect_four/board'
require_relative '../lib/connect_four/player'

# ConnectFour
module ConnectFour
  def self.new
    Game.new
  end
end
