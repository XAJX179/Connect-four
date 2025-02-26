# frozen_string_literal: true

require_relative '../../lib/connect_four/board'

describe ConnectFour::Board do
  subject(:board) { described_class.new }

  describe '#insert_at(index,value)' do
    context 'when called with index and value' do
      context 'if list at index is full' do
        it 'does not insert' do
        end
      end

      context 'if list is not full' do
        it 'appends value at the index' do
        end
      end
    end
  end
end
