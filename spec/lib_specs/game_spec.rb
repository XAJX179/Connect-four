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
    subject(:board) { double('ConnectFour::Board') }
    subject(:player1) { double('ConnectFour::Player') }
    subject(:player2) { double('ConnectFour::Player') }
    context 'when called' do
      before :each do
        allow(board).to receive(:display_board)
        allow(game).to receive(:puts)
        allow(player1).to receive(:name)
        allow(player2).to receive(:name)
        allow(game).to receive(:input_names)
      end
      it 'Calls display_board for board' do
        expect(board).to receive(:display_board)
        game.intro_messages(player1, player2, board)
      end
      it 'Calls input_names' do
        expect(game).to receive(:input_names)
        game.intro_messages(player1, player2, board)
      end
      it 'Calls name for players' do
        expect(player1).to receive(:name)
        expect(player2).to receive(:name)
        game.intro_messages(player1, player2, board)
      end
    end
  end
  describe '#game_loop' do
    subject(:board) { double('ConnectFour::Board') }
    subject(:player1) { double('ConnectFour::Player') }
    subject(:player2) { double('ConnectFour::Player') }
    context 'when called' do
      before :each do
        allow(game).to receive(:won?).and_return(false, false, false, true)
      end
      it 'call run_loop until winner found' do
        expect(game).to receive(:run_loop).exactly(3).times
        game.game_loop(player1, player2, board)
      end
    end
  end
  describe '#run_loop' do
  end

  describe '#won?' do
    it 'returns true if winner found' do
      game.instance_variable_set(:@winner, 'e')
      expect(game.won?).to eq(true)
    end
    it 'returns false if winner not found' do
      expect(game.won?).to eq(false)
    end
  end
end
