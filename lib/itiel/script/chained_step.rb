module Itiel
  module Script
    module ChainedStep
      attr_accessor :next_step

      alias :>> :next_step=

      def input=(input_stream)
        sanity_check
        self.execute(input_stream)
        next_step.input = input_stream
      end

      def sanity_check
        raise "next_step is undefined" unless self.next_step
      end

      def execute(*)
        raise "execute is not implemented"
      end
    end
  end
end
