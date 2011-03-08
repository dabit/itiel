module Itiel
  module Transformation
    #
    # Defined the behavior of the Transformation
    # and how they handle the data stream.
    #
    # All classes including this module should implement a
    # transform! method that does the real transformation.
    #
    # Than method will be called as soon as the transformation
    # receives input.
    #
    module ChainedStep
      attr_accessor :next_step

      def input=(stream)
        next_step.input = transform!(stream)
      end
    end
  end
end
