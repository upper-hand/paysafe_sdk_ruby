# frozen_string_literal: true

module Paysafe
  class Environment
    TEST = 'PAYSAFE:TEST'
    LIVE = 'PAYSAFE:LIVE'

    public_constant :TEST
    public_constant :LIVE

    def initialize
      raise StandardError 'This class should not be instantiated, use statically only.'
    end
  end
end
