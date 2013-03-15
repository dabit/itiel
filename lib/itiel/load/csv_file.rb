require 'csv'

module Itiel
  module Load
    #
    # Loads the data stream into a CSV file
    #
    # Usage:
    #
    #     @csv_file = Itiel::Load::CSVFile.new('filename.csv')
    #     @csv_file.input = []
    #
    class CSVFile
      include ChainedStep
      include Itiel::Nameable

      def initialize(file_name, append=true)
        @append    = append
        @file_name = file_name
      end

      def persist(input_stream)
        headers = input_stream.collect(&:keys).flatten.uniq
        mode    = @append ? "ab" : "w"
        skip_headers = skip_headers?

        CSV.open(@file_name, mode) do |csv|
          csv << headers unless skip_headers
          input_stream.each do |row|
            csv_row = []
            headers.each do |h|
              csv_row << row[h]
            end
            csv << csv_row
          end
        end
      end

      private
      def skip_headers?
        File.exists?(@file_name) && @append
      end
    end
  end
end
