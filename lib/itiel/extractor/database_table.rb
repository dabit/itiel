require 'active_record'

module Itiel
  module Extractor
    class DatabaseTable
      include ChainedOutputBehavior
      include Itiel::Nameable

      attr_accessor :where

      def initialize(connection)
        # TODO: Do not establish_connection if already established
        Model.set_table_name(self.class.name.demodulize.tableize)
        Model.establish_connection connection.connection_string
      end

      def in_batches
        Model.find_in_batches(:batch_size => self.batch_size) do |batch|
          yield batch
        end
      end

      class Model < ActiveRecord::Base
        def self.include_root_in_json
          false
        end
      end
    end
  end
end
