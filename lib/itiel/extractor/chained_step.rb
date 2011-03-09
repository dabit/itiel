module Itiel
  module Extractor
    #
    # Defines how the initial extractors behave
    #
    # All classes including this module must define the in_batches method
    #
    module ChainedStep
      attr_accessor :next_step, :batch_size

      def start
        self.in_batches do |rows|
          self.next_step.input = rows
        end
      end

      def in_batches
        raise "in_batches is not implemented"
      end
    end
  end
end
