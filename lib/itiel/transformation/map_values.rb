module Itiel
  module Transformation
    #
    # Maps a field value to different values
    #
    # Usage:
    #
    #      @transformation = Itiel::Transformation::MapValues.new(
    #        {
    #          "active" => { true => "yes", false => "no" }
    #        }
    #      )
    #
    # This would map all the values on the active column, true to yes and false to no
    #
    class MapValues
      include ChainedStep
      include Nameable

      attr_accessor :mapping

      def initialize(mapping)
        self.mapping = mapping
      end

      def transform!(input_stream)
        output = []
        input_stream.each do |stream_row|
          new_row = {}
          stream_row.each do |column, value|
            if self.mapping.keys.include?(column)
              new_row[column] = self.mapping[column][value] || value
            else
              new_row[column] = value
            end
          end
          output << new_row
        end
        output
      end
    end
  end
end
