# frozen_string_literal: true

require_relative '../../lib/connect_four/board'

describe ConnectFour::Board do
  subject(:board) { described_class.new }

  describe '#insert_at(index,value)' do
    context 'when called if list at index is full' do
      before do
        board.insert_at(3, 's')
        board.insert_at(3, 's')
        board.insert_at(3, 's')
        board.insert_at(3, 's')
        board.insert_at(3, 's')
        board.insert_at(3, 's')
      end

      it 'does not append' do
        list = board.data[3]
        allow(list).to receive(:append)
        board.insert_at(3, 's')
        expect(list).not_to have_received(:append)
      end
    end

    context 'when called if list is not full' do
      it 'appends value at the index' do
        list = board.data[2]
        allow(list).to receive(:append)
        board.insert_at(2, 's')
        expect(list).to have_received(:append).once
      end
    end
  end

  describe '#space_left?' do
    context 'when called with valid index' do
      it 'returns true if space left in the list' do
        expect(board.space_left?(1)).to be true
      end

      it 'return false if list is full' do # rubocop:disable RSpec/ExampleLength
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        expect(board.space_left?(1)).to be false
      end
    end
  end

  describe '#four_connected?' do
    context 'when four in vertical_lines' do
      it 'returns true' do
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        board.insert_at(1, 's')
        expect(board.four_connected?).to be true
      end
    end

    context 'when four in horizontal_lines' do
      it 'returns true' do
        board.insert_at(1, 's')
        board.insert_at(2, 's')
        board.insert_at(3, 's')
        board.insert_at(4, 's')
        expect(board.four_connected?).to be true
      end
    end

    context 'when four in left_diagonal_lines' do
      before do
        board.insert_at(1, 's')
        board.insert_at(2, 'a')
        board.insert_at(2, 's')
        board.insert_at(3, 'a')
        board.insert_at(3, 'a')
        board.insert_at(3, 's')
        board.insert_at(4, 'a')
        board.insert_at(4, 'a')
        board.insert_at(4, 'a')
        board.insert_at(4, 's')
      end

      it 'returns true' do
        expect(board.four_connected?).to be true
      end
    end

    context 'when four in right_diagonal_lines' do
      before do
        board.insert_at(4, 's')
        board.insert_at(3, 'a')
        board.insert_at(3, 's')
        board.insert_at(2, 'a')
        board.insert_at(2, 'a')
        board.insert_at(2, 's')
        board.insert_at(1, 'a')
        board.insert_at(1, 'a')
        board.insert_at(1, 'a')
        board.insert_at(1, 's')
      end

      it 'returns true' do
        expect(board.four_connected?).to be true
      end
    end

    context 'when no fours in board' do
      it 'returns false' do
        expect(board.four_connected?).to be false
      end
    end
  end

  describe '#four_in_line?' do
    context 'when there is no four' do
      it 'returns false' do
        line = [nil, 'a', 's', 's', 's']
        expect(board.four_in_line?(line)).to be false
      end
    end

    context 'when there is four' do
      it 'returns true' do
        line = [nil, 'a', 's', 's', 's', 's']
        expect(board.four_in_line?(line)).to be true
      end
    end
  end
end
