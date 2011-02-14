require 'csv'

module Itiel
  module Sources
    class CSVFile
      include Itiel::InputOutputDefinitions
      include Itiel::Nameable

      def initialize(file_name)
        puts File.expand_path(file_name)
        # Let's assume for now that header will always
        # be present
        contents = CSV.read(file_name, :headers => true)
        @output = []
        contents.each do |r|
          @output << r.to_hash
        end
      end

      def output
        @output
      end
    end
  end
end
