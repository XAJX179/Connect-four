# frozen_string_literal: true

require_relative 'data_structure/column'
require_relative '../connect_four/display'

# ConnectFour
module ConnectFour
  # Board for ConnectFour game
  class Board
    # @return {Integer=> Column}  column_number => Column , whole board data
    # @note There are 7 columns with max height of 6 in a Board.
    attr_reader :data

    def initialize
      @data = (1..7).to_h { |i| [i, Column.new] }
    end

    include Display

    # @param (Integer,String)
    # @return (void)
    def insert_at(column_number, peice)
      list = @data[column_number]
      list.append(peice) unless list.full?
    end

    # @param Integer column_number for the column on the Board {#data}
    # @return Boolean returns true if column is not {Column#full?} else false
    def space_left?(column_number)
      column = @data[column_number]
      !column&.full?
    end

    # @return [Boolean]
    #
    # returns true if four connected peices vertically,horizontally or diagonally found else false
    def four_connected?
      # if a line is found in one direction this won't check others.
      lines = (vertical_lines + horizontal_lines + left_diagonal_lines + right_diagonal_lines)

      lines.each do |line|
        return true if four_in_line?(line)
      end
      false
    end

    # @param Array a line
    # @return Boolean returns true if four consecutive non nil values found in a line else false
    def four_in_line?(line)
      result = false
      line.each_cons(4) do |elements|
        next if elements.include?(nil)

        first_element = elements.first
        result = true if elements.all?(first_element)
      end
      result
    end

    def vertical_lines
      # due to LinkedList nature there will be no nil as space in between the values
      # in vertical_lines because i am only appending non nil values.
      lists = @data.values.filter { |e| e.size > 3 }
      lists.map do |list|
        list.map { |node| node.data }
      end
    end

    def horizontal_lines # rubocop:disable Metrics/MethodLength
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

    def left_diagonal_lines # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
      # for readability disable some style
      arrays = []
      (3..5).each do |index|
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

    def right_diagonal_lines # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
      # for readability disable some style
      arrays = []
      (0..2).each do |index|
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
