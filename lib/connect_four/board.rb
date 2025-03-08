# frozen_string_literal: true

require_relative 'data_structure/column'
require_relative '../connect_four/display'

# ConnectFour
module ConnectFour
  # Board for ConnectFour game
  class Board # rubocop:disable Metrics/ClassLength
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

    def space_left?(index)
      list = @data[index]
      list.size < 6 unless list.nil?
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

    def four_in_line?(line) # rubocop:disable Metrics/MethodLength
      highest_count = 0
      current_value = line.first
      line.each do |e|
        if e.nil?
          highest_count = 0
        elsif e == current_value
          highest_count += 1
        else
          current_value = e
          highest_count = 1
        end
        return true if highest_count == 4
      end
      false
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
