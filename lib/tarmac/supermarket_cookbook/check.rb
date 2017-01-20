require 'tarmac/supermarket_cookbook/version'
require 'tarmac/supermarket_cookbook/metadata'
require 'tarmac/supermarket_cookbook/source'


module Tarmac
  module SupermarketCookbook
    class Check
      def intialize(input:)
        data = JSON.parse(input)
        @src = Source.from(data['source'])

        # This will be omitted from the first request
        if data['version']
          @version = data['version']['version']
        end
      end

      def run
        refresh_available_versions
      end

      def output
        JSON.pretty_generate(current_version)
      end

      private

      def metadata
        @metadata = Metadata.new(@src.name)
      end

      def refresh_available_versions
        @available_versions = @metadata.available.map do |version|
          Semverse::Version.new(version)
        end
      end

      def available_versions
        @available_versions
      end

      def latest_version
        [{version: @metadata.latest}]
      end

      def current_constraint
        @current_constraint ||= Semverse::Constraint.new(@src.constraint)
      end

      def candidates
        available_versions.select {|item| current_constraint.satisfies?(item) }.sort
      end

      def candidate_versions
        candidates.map { |version|  }[{version: version.to_s}]
      end

      def current_version
        if version
          candidate_versions
        else
          latest_version
        end
      end
    end
  end
end
