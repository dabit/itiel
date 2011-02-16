require 'csv'

module Itiel
  module Extractors
    class CSVFile
      include InputOutputBehavior
      include Itiel::Nameable

      attr_accessor :file_name

      def initialize(file_name)
        self.file_name = file_name
      end

      def load!
        # Let's assume for now that header will always
        # be present
        contents = CSV.read(self.file_name, :headers => true)
        output_stream = []
        contents.each do |r|
          output_stream << r.to_hash
        end
        output_stream
      end
    end
  end
end
