require 'sequel'

module Itiel
  module Extractor
    #
    # Creates a stream from the specified SQL query
    #
    class CustomSQL
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :connection_string, :script, :batch_size

      def in_batches
        db = Sequel.connect(self.connection_string)
        offset = 0
        while db[script].limit(self.batch_size, offset).count > 0
          yield db[script].limit(self.batch_size, offset).all
          offset += self.batch_size
        end
      end
    end
  end
end
