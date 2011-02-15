require 'csv'

module Itiel
  module Sources
    class CSVFile
      include Itiel::InputOutputDefinitions
      include Itiel::Nameable

      def initialize(file_name)
        # Let's assume for now that header will always
        # be present
        contents = CSV.read(file_name, :headers => true)
        self.output = []
        contents.each do |r|
          self.output << r.to_hash
        end
      end
    end
  end
end
