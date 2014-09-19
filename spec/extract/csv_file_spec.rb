require 'spec_helper'

describe Itiel::Extract::CSVFile do
  before :each do
    @step = Itiel::Extract::CSVFile.new 'FILENAME'
  end

  describe "#extract" do
    it "reads a csv file and returns it as a hash to the stream" do
      row = double
      allow(row).to receive(:to_hash).and_return({data: true})

      @stream = [ row ]
      allow(CSV).to receive(:read).
          with('FILENAME', headers: true).
          and_return(@stream)

      expect(@step.extract).to eq [{ data: true }]
    end
  end
end

