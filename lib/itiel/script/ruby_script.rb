module Itiel
  module Script
    #
    # Process the stream with ruby
    #
    # Initialize it with a block that will yield each row of the stream.
    #
    # Usage:
    #
    #   Itiel::Script::RubyScript.new do |row|
    #     row["slug"] = row["title"]
    #   end
    #
    class RubyScript
      include ChainedStep

      attr_accessor :block

      def initialize(&block)
        self.block = block
      end

      def execute(input_stream)
        input_stream.each do |row|
          block.call(row)
        end
      end
    end
  end
end

