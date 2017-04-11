module Itiel
  module DB
    #
    # Truncates specified tables
    #
    # Usage:
    #
    #     @truncator = Itiel::DB::Truncator.new "tables", "to", "truncate"
    #     @truncator.connection = :database
    #     @truncator.truncate!
    #
    class Truncator
      include Itiel::Nameable
      include Itiel::DB::SQLConnectable

      attr_accessor :tables

      def initialize(*tables)
        self.tables = tables
      end

      def truncate!
        tables.each do |table|
          db = self.class.sequel_connection(connection)
          db[table.to_sym].truncate
        end
      end
    end
  end
end
