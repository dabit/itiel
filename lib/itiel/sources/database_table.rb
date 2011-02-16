require 'active_record'

module Itiel
  module Sources
    class DatabaseTable
      include Itiel::Nameable
      include InputOutputBehavior

      attr_accessor :where

      def initialize(connection)
        # TODO: Do not establish_connection if already established
        Model.set_table_name(self.class.name.demodulize.tableize)
        Model.establish_connection connection.connection_string
      end

      def load!
        Model.all.collect {|r| r.attributes}
      end

      class Model < ActiveRecord::Base
      end
    end
  end
end
