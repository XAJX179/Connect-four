# frozen_string_literal: true

# ConnectFour
module ConnectFour
  # Player
  class Player
    attr_reader :name, :sign

    def initialize(sign)
      @name = nil
      @sign = sign
    end

    def input_name
      gets.chomp
    end
  end
end
