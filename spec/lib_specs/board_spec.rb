# frozen_string_literal: true

require_relative '../../lib/connect_four/board'

describe ConnectFour::Board do
  let(:board) { described_class.new }
  describe '#new' do
    it 'Creates and returns new Board Object' do
      expect(board).to be_instance_of(ConnectFour::Board)
    end
  end
  describe '#data' do
    it 'returns data of the board' do
      expect(board.data).to be_kind_of(Hash)
    end
  end
end
