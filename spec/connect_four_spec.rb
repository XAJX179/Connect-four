# frozen_string_literal: true

require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#new' do
    it 'Creates and returns new Game object.' do
      game = described_class.new
      expect(game).to be_instance_of(ConnectFour::Game)
    end
  end
end
