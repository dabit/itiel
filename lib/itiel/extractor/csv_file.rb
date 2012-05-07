require 'csv'

module Itiel
  module Extractor
    #
    # Extracts all specified CSV file rows and sends it in batches to
    # its next step
    #
    # Usage:
    #
    #    csv_file            = Itiel::Extractor::CSVFile.new('FileName.csv')
    #    csv_file.batch_size = 15
    #    csv.file.start
    #
    class CSVFile
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :file_name

      def initialize(file_name)
        self.file_name = file_name
      end

      def extract
        lines = CSV.read(self.file_name, :headers => true)
        lines.collect(&:to_hash)
      end
    end
  end
end
