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

    def four_connected?
      lines = vertical_lines
      lines.each do |line|
        return true if four_in_line?(line)
      end

      lines = horizontal_lines
      lines.each do |line|
        return true if four_in_line?(line)
      end

      lines = left_diagonal_lines
      lines.each do |line|
        return true if four_in_line?(line)
      end

      lines = right_diagonal_lines
      lines.each do |line|
        return true if four_in_line?(line)
      end
      false
    end

    def four_in_line?(line) # rubocop:disable Metrics/MethodLength
      highest_count = 0
      # pp "line => #{line}"
      # pp "line => #{line.first}"
      current_value = line.first
      line.each do |e|
        if e.nil?
          # pp 'nil'
          highest_count = 0
        elsif e == current_value
          highest_count += 1
          # pp 'good'
        else
          current_value = e
          highest_count = 1
          # pp 'naw'
        end
        return true if highest_count == 4
      end
      false
    end

    def vertical_lines
      # due to LinkedList nature there will be no nil as space in between the values
      # because i am only appending non nil values.
      lists = @data.values.filter { |e| e.size > 3 }
      lists.map do |list|
        list.map { |node| node.data }
      end
    end

    def horizontal_lines
      arrays = []
      5.downto(0) do |index|
        array = []
        @data.each_value do |elem|
          node = elem.at(index)
          data = node.data unless node.nil?
          array << data # appens nil if there's no node for storing space between
        end
        arrays << array unless array.length < 4
      end
      arrays
    end

    def left_diagonal_lines
      arrays = []
      (3..5).each do |index|
        # pp "index => #{index}"
        array = []
        @data.each_value do |list|
          break if index.negative?

          node = list.at(index)
          data = node.data unless node.nil?
          array << data
          index -= 1
        end
        arrays << array
      end
      (0..2).each do |index|
        # pp "index => #{index}"
        array = []
        @data.each_value.reverse_each do |list|
          break if index > 5

          node = list.at(index)
          data = node.data unless node.nil?
          array << data
          index += 1
        end
        arrays << array
      end
      arrays
    end

    def right_diagonal_lines
      arrays = []
      (0..2).each do |index|
        # pp "index => #{index}"
        array = []
        @data.each_value do |list|
          break if index > 5

          node = list.at(index)
          data = node.data unless node.nil?
          array << data
          index += 1
        end
        arrays << array
      end
      (3..5).each do |index|
        # pp "index => #{index}"
        array = []
        @data.each_value.reverse_each do |list|
          break if index.negative?

          node = list.at(index)
          data = node.data unless node.nil?
          array << data
          index -= 1
        end
        arrays << array
      end
      arrays
    end
  end
end
