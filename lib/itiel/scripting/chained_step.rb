module Itiel
  module Scripting
    module ChainedStep
      attr_accessor :next_step

      def input=(input_stream)
        sanity_check
        self.execute(input_stream)
        next_step.input = input_stream
      end

      def sanity_check
        raise "next_step is not defined" unless self.next_step
      end

      def execute(*)
        raise "execute is not implemented"
      end
    end
  end
end
