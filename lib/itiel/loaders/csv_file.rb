require 'csv'

module Itiel
  module Loaders
    class CSVFile
      include InputOutputBehavior
      include Itiel::Nameable

      def initialize(file_name)
        @file_name = file_name
      end

      def persist!(input_stream)
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
      end
    end
  end
end
