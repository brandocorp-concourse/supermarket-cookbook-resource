module Tarmac
  module SupermarketCookbook
    class Metadata
      def intialize(cookbook:, host: 'supermarket.chef.io')
        @cookbook = cookbook
        @supermarket = 'https://' + host
        @data = Net::HTTP.get(URI("#{@supermarket}/api/v1/cookbooks/#{cookbook}"))
      end

      def available
        @data['versions'].map do |version|
          strip_version_from_url(version))
        end
      end

      def latest
        strip_version_from_url(data['latest_version'])
      end

      private

      def strip_version_from_url(http)
        http.split('/').last
      end
    end
  end
end
