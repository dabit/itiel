module Itiel
  module Script
    #
    # Executes a SQL script or command on the specified
    # connection
    #
    class SQLScript
      include ChainedStep
      include Itiel::DB::SQLConnectable

      attr_accessor :connection
      attr_accessor :sql

      def initialize(*args)
        self.sql = args[0]
      end

      def execute(*)
        db = self.class.sequel_connection(connection)
        db << sql
      end

      def sanity_check
        raise Itiel::MissingConnection unless self.connection
        raise Itiel::SQLSentenceNotProvided.new unless self.sql
      end
    end
  end
end
