require 'csv'

module Itiel
  module Extractor
    class CSVFile
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :file_name

      def initialize(file_name)
        self.batch_size = 20000
        self.file_name = file_name
      end

      def in_batches
        lines = []
        i = 0
        CSV.foreach(self.file_name, :headers => true) do |f|
          lines << f.to_hash
          i += 1
          if i == self.batch_size
            yield lines
            i = 0
            lines.clear
          end
        end
        yield lines if lines.size > 0
      end

      # def load!
      #   # Let's assume for now that header will always
      #   # be present
      #   contents = CSV.read(self.file_name, :headers => true)
      #   output_stream = []
      #   contents.each do |r|
      #     output_stream << r.to_hash
      #   end
      #   output_stream
      # end
    end
  end
end
