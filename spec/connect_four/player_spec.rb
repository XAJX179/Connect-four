# frozen_string_literal: true

require_relative '../../lib/connect_four/player'

describe ConnectFour::Player do
  describe '#input_move' do
    subject(:player_move) { described_class.new('s') }

    let(:real_board) { ConnectFour::Board.new }

    before do
      $stdin = StringIO.new
      allow_any_instance_of(described_class).to receive(:print) # rubocop:disable RSpec/AnyInstance
    end

    after do
      $stdin = STDIN
    end

    it 'calls gets until valid move is inputted' do
      allow($stdin).to receive(:gets).and_return('8', '8', '8', '4')
      player_move.instance_variable_set(:@name, 's')
      player_move.input_move(real_board)
      expect($stdin).to have_received(:gets).exactly(4).times
    end
  end
end
