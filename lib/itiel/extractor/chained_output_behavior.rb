module Itiel
  module Extractor
    module ChainedOutputBehavior
      attr_accessor :next_step, :batch_size

      def initialize
        self.batch_size ||= 20000
      end

      def start
        self.in_batches do |batch|
          next_step.input = batch
        end
      end
    end
  end
end
