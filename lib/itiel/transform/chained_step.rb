module Itiel
  module Transform
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

      alias :>> :next_step=

      def input=(stream)
        next_step.input = transform!(stream)
      end

      def transform!(stream)
        raise Itiel::MethodNotImplementedException.new "You need to define the transform! method in the implementing class"
      end
    end
  end
end
