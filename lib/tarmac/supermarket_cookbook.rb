require 'tarmac/supermarket_cookbook/check'
require 'tarmac/supermarket_cookbook/in'
require 'tarmac/supermarket_cookbook/out'

module Tarmac
  module SupermarketCookbook
    module_function

    def check(input:)
      request = Check.new(input)
      puts request.output
    end

    def in(destination:, input:)
      request = In.new(input)
      request.run
      puts request.output
    end

    def out(source:, input:)
      request = Out.new(input)
      request.run
      puts request.output
    end
  end
end
