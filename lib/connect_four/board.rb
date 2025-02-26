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
        1 => LinkedList.new,
        2 => LinkedList.new,
        3 => LinkedList.new,
        4 => LinkedList.new,
        5 => LinkedList.new,
        6 => LinkedList.new,
        7 => LinkedList.new
      }
    end

    include Display

    def insert_at(index, value)
      list = @data[index]
      list.append(value) unless list.size == 6
    end

    def space_left?(index)
      list = @data[index]
      list.size < 6 unless list.nil?
    end
  end
end
