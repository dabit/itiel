module Itiel
  module Lookup
    class CSVFile
      include ChainedStep
      include HashLookup

      def initialize(file_name)
        @file_name = file_name
      end

      def lookup_source
        CSV.table @file_name
      end
    end
  end
end
