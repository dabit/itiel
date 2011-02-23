module Itiel
  module DB
    class Connection
      include Itiel::Nameable

      attr_accessor :sources_file
      attr_accessor :connection_name

      def initialize
        self.sources_file = 'config/sources.yml'
      end

      def connection_string(refresh = false)
        @connection = ( refresh ? load_from_file : @connection ||= load_from_file)
      end

      private
      def load_from_file
        yaml = YAML.load_file(self.sources_file)
        yaml[self.connection_name]
      end
    end
  end
end
