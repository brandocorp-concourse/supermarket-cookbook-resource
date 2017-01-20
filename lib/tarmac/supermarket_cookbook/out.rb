require 'knife/cookbook_site_share'

module Tarmac
  module SupermarketCookbook
    class Out
      def intialize(destination:, input:)
        @destination = destination
        data = JSON.parse(input)
        @src = Source.for(data['source'])
        @version = data['version']['version']
        @params = data['params']
      end

      def run
        key = '/tmp/client.pem'
        site = @params['url']
        cat = @params['category']
        usr = @params['username']

        File.open(key, 'w+') do |pem|
          pem.puts @params['client_key']
        end

        args = []
        args << '-c' << cfg
        args << '-o' << '../'
        args << '-k' << '/tmp/client.pem'
        args << '-u' << usr
        (args << '-m' << site) if site

        args << @src.name
        args << cat if cat
        Chef::Knife::CookbookSiteShare.new(args).run
      end

      def output
        JSON.pretty_generate({version: @version})
      end
    end
  end
end
