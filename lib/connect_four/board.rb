# frozen_string_literal: true

require_relative 'data_structure/linked_list'
require_relative '../connect_four/display'

# ConnectFour
module ConnectFour
  # Board for ConnectFour game
  class Board
    attr_reader :data

    def initialize
      @data = {
        7 => LinkedList.new,
        6 => LinkedList.new,
        5 => LinkedList.new,
        4 => LinkedList.new,
        3 => LinkedList.new,
        2 => LinkedList.new,
        1 => LinkedList.new
      }
    end

    include Display
  end
end
