module Itiel
  module Transformations
    #
    # This module defines the behavior for input and output
    # on all our transformations.
    #
    # Whenever a transformation receives input, it stores the result of
    # transform! on the output
    #
    # All the Transformation classes should at least define transform!
    #
    module InputOutputBehavior
      module InstanceMethods
        attr_accessor :input
        #
        # Returns cached output by default, call it with true to run the
        # transformation before sending the output
        #
        def output(cached = true)
          if cached
            @output ||= transform!(self.input)
          else
            @output = transform!(self.input)
          end
        end

        #
        # This method has to be implemented an the Transformation class
        #
        def transform!(input_stream)
        end
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
