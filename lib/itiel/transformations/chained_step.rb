module Itiel
  module Transformations
    module ChainedStep
      attr_accessor :next_step

      def input=(stream)
        next_step.input = transform!(stream)
      end
    end
  end
end
