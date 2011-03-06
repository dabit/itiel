module Itiel
  module Scripting
    #
    # Executes a SQL script or command on the specified
    # connection
    #
    class SQLScript
      include InputOutputBehavior

      attr_accessor :connection
      attr_accessor :sql

      def initialize(*args)
        self.sql = args[0]
      end

      def execute!
        sanity_check

        Executor.establish_connection connection.connection_string
        Executor.connection.execute(self.sql)
        Executor.clear_all_connections!
      end

      private
      def sanity_check
        raise "No connection was specified to run the script" \
            unless connection

        raise "Connection is not Itiel::DB::DatabaseConnection" \
            unless connection.is_a?(Itiel::DB::Connection)

        raise "No SQL to execute given" \
            unless self.sql
      end

      class Executor < ActiveRecord::Base ; end
    end

  end
end
