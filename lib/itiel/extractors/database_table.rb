require 'active_record'

module Itiel
  module Extractors
    class DatabaseTable
      include Itiel::Nameable

      attr_accessor :next_step
      attr_accessor :where

      def initialize(connection)
        # TODO: Do not establish_connection if already established
        Model.set_table_name(self.class.name.demodulize.tableize)
        Model.establish_connection connection.connection_string
      end

      def start
        Model.find_in_batches(:batch_size => 20000) do |batch|
          next_step.input = JSON.parse(batch.to_json)
        end
      end

      def output
        Model.all.collect { |r| r.attributes }
      end

      class Model < ActiveRecord::Base
        def self.include_root_in_json
          false
        end
      end
    end
  end
end
