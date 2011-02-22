module Itiel
  module Transformations
    class SingleColumnSort
      include InputOutputBehavior
      include Itiel::Nameable

      SORT_ORDER = [
        :asc,
        :desc
      ]

      attr_accessor :sort_column, :sort_order

      def initialize(sort_column, sort_order = :asc)
        raise "Unrecognized sort_order, expected one of: :asc, :desc" unless SORT_ORDER.include?(sort_order)
        self.sort_order  = sort_order
        self.sort_column = sort_column
      end


      def transform!(input_stream)
        output_stream = []
        if self.sort_order == :asc
          output_stream = input_stream.sort { |a,b| a[self.sort_column] <=> b[self.sort_column] }
        else
          output_stream = input_stream.sort { |a,b| b[self.sort_column] <=> a[self.sort_column] }
        end
      end
    end
  end
end
