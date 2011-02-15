require 'csv'

module Itiel
  module Outputs
    class CSVFile
      include Itiel::InputOutputDefinitions

      def initialize(file_name)
        @file_name = file_name
      end

      def input=(input_stream)
        headers = input_stream.collect(&:keys).flatten.uniq
        CSV.open(@file_name, "w") do |csv|
          csv << headers
          input_stream.each do |row|
            csv_row = []
            headers.each do |h|
              csv_row << row[h]
            end
            csv << csv_row
          end
        end

        @output = input_stream
      end
    end
  end
end
