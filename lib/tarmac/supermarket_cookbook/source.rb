module Tarmac
  module SupermarketCookbook
    class Source
      def self.from(data: {})
        cookbook = data.fetch('name')
        constraint = data.fetch('constraint')
        supermarket_url = data.fetch('supermarket_url')

        new(name: cookbook, constraint: constraint, supermarket_url: supermarket_url)
      end

      attr_reader :name, :constraint, :supermarket_url

      def initialize(name:, constraint:, supermarket_url:)
        @supermarket_url = supermarket_url
        @name = name
        @constraint = constraint
      end
    end
  end
end
