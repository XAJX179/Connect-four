# frozen_string_literal: true

require_relative '../../lib/connect_four/game'

describe 'ConnectFour::Game' do
  let(:board) { instance_double(ConnectFour::Board) }
  let(:player) { instance_double(ConnectFour::Player) }

  before do
    allow_any_instance_of(ConnectFour::Game).to receive(:puts) # rubocop:disable RSpec/AnyInstance
    allow(board).to receive(:display_board)
    allow(player).to receive(:input_name)
    allow(player).to receive(:name).and_return('a', 'b')
  end

  describe '#input_names' do
    subject(:game_input) { ConnectFour::Game.new }

    context 'when called' do
      it 'sends #input_name to players' do
        game_input.input_names(player, player)
        expect(player).to have_received(:input_name).twice
      end
    end
  end

  describe '#won?' do
    subject(:game_won) { ConnectFour::Game.new }

    context 'when called' do
      it 'returns true if winner found' do
        game_won.instance_variable_set(:@winner, 'player1')
        expect(game_won.won?).to be(true)
      end

      it 'returns false if winner not found' do
        expect(game_won.won?).to be(false)
      end
    end
  end

  describe '#check_win' do
    subject(:real_board) { ConnectFour::Board.new }

    let(:game_check) { ConnectFour::Game.new }

    context 'when called with win pair' do
      before do
        real_board.insert_at(1, 'a')
        real_board.insert_at(1, 'a')
        real_board.insert_at(1, 'a')
        real_board.insert_at(1, 'a')
      end

      it 'returns true' do
        expect(game_check.check_win(real_board)).to be true
      end
    end

    context 'when called without a win pair' do
      it 'returns false' do
        expect(game_check.check_win(real_board)).to be false
      end
    end
  end
end
