module Itiel
  module Outputs
    class DatabaseTable
      include Itiel::InputOutputDefinitions
      include Itiel::Nameable

      def initialize(connection)
        Model.set_table_name(self.class.name.demodulize.tableize)
        Model.establish_connection connection.connection_string
      end

      def input(input_stream)
        input_stream.each do |element|
          Model.create(element)
        end
      end

      class Model < ActiveRecord::Base; end
    end
  end
end
