module Itiel
  module Lookup
    #
    # This module defines the input and output behavior of Lookup Steps.
    #
    # Whenever the instance receives input, it calls lookup! and set its return value
    # as the input of its next_step if defined.
    #
    # All the classes that include this moudle must implement lookup!
    #
    module ChainedStep
      module InstanceMethods
        attr_accessor :next_step, :output
        alias :>> :next_step=

        def input=(input_stream)
          Itiel::Logger.log_received(self, input_stream.size)
          self.output = lookup!(input_stream)
          #puts output if table_name == "profiles"
          #puts input_stream if table_name == "profiles"
          self.next_step.input = output if next_step
          Itiel::Logger.log_processed(self, input_stream.size)
        end

        def lookup!(input_stream)
          raise "lookup is not implemented"
        end
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
