module Itiel
  module Load
    #
    # This module defines the input and output behavior for Loader steps
    #
    # Whenever the instance receives input, it calls persist! and then
    # wires the input and the output
    #
    # All the clasess in Itiel::Output should implement persist!
    #
    module ChainedStep
      module InstanceMethods
        attr_accessor :next_step

        alias :>> :next_step=

        def input=(input_stream)
          Itiel::Logger.log_received(self, input_stream.size)
          persist(input_stream)
          self.next_step.input = input_stream if next_step
          Itiel::Logger.log_processed(self, input_stream.size)
        end

        #
        # This method must be implemented in the class
        #
        def persist(input_stream)
          raise "persist is not implemented"
        end
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
