require 'test_helper'

describe Itiel::Extract::CSVFile do
  before :each do
    @step = Itiel::Extract::CSVFile.new 'FILENAME'
  end

  describe "#extract" do
    it "reads a csv file and returns it as a hash to the stream" do
      row = mock
      mock(row).to_hash.returns({:data => true})

      @stream = [ row ]
      mock(CSV).read('FILENAME', :headers => true).returns(@stream)

      assert_equal @step.extract, [{ :data => true }]
    end
  end
end

