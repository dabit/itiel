module Itiel
  module Extract
    #
    # Defines how the initial extractors behave
    #
    # All classes including this module must define the in_batches method
    #
    module ChainedStep
      attr_accessor :next_step

      alias :>> :next_step=

      def start
        self.next_step.input = extract
      end

      def extract
        raise "extract is not implemented"
      end
    end
  end
end
