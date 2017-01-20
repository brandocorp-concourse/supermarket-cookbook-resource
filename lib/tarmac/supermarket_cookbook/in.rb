module Tarmac
  module SupermarketCookbook
    class In
      def intialize(destination:, input:)
        @destination = destination
        data = JSON.parse(input)
        @src = Source.for(data['source'])
        @version = data['version']['version']
      end

      def run
        File.open(File.join(destination, 'version'), 'w+') do |file|
          file.write @version
        end
      end

      def output
        JSON.pretty_generate({version: @version})
      end
    end
  end
end
