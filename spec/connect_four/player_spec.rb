# frozen_string_literal: true

require_relative '../../lib/connect_four/player'

describe ConnectFour::Player do
  describe '#input_move' do
    subject(:player_move) { described_class.new('s') }

    let(:real_board) { ConnectFour::Board.new }

    before do
      allow(player_move).to receive(:gets).and_return('8', '8', '8', '4') # rubocop:disable RSpec/SubjectStub
    end

    it 'calls gets until valid move is inputted' do
      player_move.input_move(real_board)
      expect(player_move).to have_received(:gets).exactly(4).times # rubocop:disable RSpec/SubjectStub
    end
  end
end
