require 'sequel'

module Itiel
  module DB
    module SQLConnectable
      attr_accessor :connection, :connection_file_path

      module ClassMethods
        def connection_file_path
          @@connection_file_path ||= 'config/database.yml'
        end

        def connection_file_path=(value)
          @@connection_file_path = value
        end

        def sequel_connection(connection_name)
          Sequel.connect read_connection_string(connection_name)
        end

        protected
        def read_connection_string(connection_name)
          @connections ||= YAML.load_file(connection_file_path)
          @connections[connection_name.to_s]
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
