module Itiel
  module Extractors
    class DatabaseConnection
      attr_accessor :sources_file
      attr_accessor :connection_name

      def initialize
        self.sources_file = 'config/sources.yml'
      end

      def connection_string
        yaml = YAML.load_file(sources_file)
        yaml[connection_name]
      end
    end
  end
end
