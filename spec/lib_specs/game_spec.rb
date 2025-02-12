# frozen_string_literal: true

require_relative '../../lib/connect_four/game'

describe ConnectFour::Game do
  let(:game) { described_class.new }
  describe '#new' do
    it 'Creates and returns new Game object' do
      expect(game).to be_instance_of(ConnectFour::Game)
    end
  end
  describe '#start' do
    context 'when called' do
      it 'Creates new Players' do
        allow(game).to receive(:intro_messages)
        expect(ConnectFour::Player).to receive(:new).twice
        game.start
      end
      it 'Creates new Board' do
        allow(game).to receive(:intro_messages)
        expect(ConnectFour::Board).to receive(:new).once
        game.start
      end
    end
  end
  describe '#intro_messages' do
    context 'when called' do
      it 'Calls display_board for board' do
        board = double('ConnectFour::Board')
        allow(board).to receive(:display_board)
        allow(game).to receive(:puts)
        expect(board).to receive(:display_board)
        game.intro_messages('player1', 'player2', board)
      end
    end
  end
end
