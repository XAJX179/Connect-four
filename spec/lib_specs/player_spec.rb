# frozen_string_literal: true

require_relative '../../lib/connect_four/player'

describe ConnectFour::Player do
  describe '#new' do
    it 'Creates and returns new Player object' do
      player = described_class.new
      expect(player).to be_instance_of(ConnectFour::Player)
    end
  end
end
