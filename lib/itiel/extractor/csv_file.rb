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
        self.batch_size = 20000
        self.file_name = file_name
      end

      def in_batches
        lines = []
        CSV.open(self.file_name, headers: true) do |csv|
          csv.each do |f|
            lines << f.to_hash
            if ((csv.lineno - 1) % self.batch_size) == 0
              yield lines
              lines.clear
            end
          end
        end
        yield lines if lines.size > 0
      end
    end
  end
end
